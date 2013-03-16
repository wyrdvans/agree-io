class SignaturesController < ApplicationController

  respond_to :html, :json

  before_filter :enforce_required_parameters, except: 'show'

  def show
    @signature = Signature.where(id: params[:id]).first
  end

  def new
    @signature = Signature.new
    respond_with @signature
  end

  def create
    @signature = Signature.create!(term: term, participant: participant)
    respond_with @signature, location: @signature, status: '201'
  end

  protected

  def enforce_required_parameters
    return true if term.present? && participant.present?
    raise Trespasser
  end

  def term
    @term ||= Term.where(id: params[:term_id]).first
  end

  def participant
    @participant ||= term.participants.where(id: params[:participant_id]).first
  end

end
