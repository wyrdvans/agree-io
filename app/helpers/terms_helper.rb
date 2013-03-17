module TermsHelper

  def signature_link term, email
    participant = @term.participants.where(email: current_email).first
    if participant.signature.present?
      link_to "View Signature", participant.signature
    else
      link_to "Leave Signature", new_signature_path(participant_id: participant, term_id: term.id)
    end
  end

end
