class TermsController < ApplicationController

  respond_to :html, :json

  def index
    if current_email.present?
      @terms = Participant.
        where(email: current_email).
        joins(:term).
        map(&:term)
    else
      @terms = []
    end
  end

  def show
    @term = Term.where(id: params[:id]).first
    respond_with @term, methods: 'content'
  end

  def new
    @term = Term.new
    respond_with @term
  end

  def create
    @term = Term.new()
    @term.content = term[:content]
    @term.emails = term[:emails]
    @term.save

    if @term.invalid?
      flash[:error] = "The terms could not be saved."
    end

    respond_with @term
  end

  def edit
    @term = Term.where(id: params[:id]).first

    unless @term.revisable?
      raise Trespasser.new("Do not try to edit signed terms.")
    end

    respond_with @term
  end

  def update
    @term = Term.where(id: params[:id]).first

    unless @term.revisable?
      raise Trespasser.new("Do not try to edit signed terms.")
    end

    @term.content = term[:content]
    @term.emails = term[:emails]
    @term.save

    respond_with @term
  end

  private

  def term
    params.require(:term).permit(:content, :emails)
  end


end
