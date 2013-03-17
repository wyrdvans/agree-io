class TermSender < ActionMailer::Base
  default from: "agree.io@app13528860.mailgun.org"

  def send_to_participants term
    term.participants.map do |participant|
      @term_id = term.id
      @participant_id = participant.id
      mail(subject: "New Terms: Do you agree?",
           to: participant.email)
    end
  end

end
