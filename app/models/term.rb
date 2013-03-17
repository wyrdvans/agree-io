class Term < ActiveRecord::Base

  primary_key = 'id'

  has_many :revisions
  has_many :participants
  has_many :signatures

  validates_associated :revisions
  validates_associated :participants
  validates :content, presence: true
  validates :emails, presence: true
  validates :participants, length: { minimum: 1, maximum: 12 }

  after_save :inform_participants

  def content
    self.revisions.last.try(:content)
  end

  def content= str
    self.revisions << Revision.new(content: str)
  end

  def emails
    self.participants.map(&:email).join(", ")
  end

  def emails= str
    take_emails(str).each do |email|
      self.participants << Participant.new(email: email)
    end
  end

  def sign! participant_id, ip, mac
    Signature.create(participant_id: participant_id, term_id: self.id, ip: ip, mac: mac)
  end

  def signed?
    self.signatures.present?
  end

  def revisable?
    self.signatures.empty?
  end

  def revise!(content)
    if revisable?
      self.revisions << Revision.create(content: content)
    end
  end

  def involve!(str)
    take_emails(str).each do |email|
      self.participants << Participant.create(email: email)
    end
  end

  private

  def take_emails str
    if str.present?
      str.split(/[\s,;]+/).uniq
    else
      []
    end
  end

  def inform_participants
    TermSender.send_to_participants self
  end

end
