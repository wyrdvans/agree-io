class TermsController < ApplicationController

  respond_to :html, :json

  def index
    @terms = Term.all
  end

  def show
    @term = Term.where(id: params[:id]).first
    respond_with @term
  end

  def new
    @term = Term.new
    respond_with @term
  end

  def create
    @term = Term.new()
    @term.revisions << Revision.new(content: term[:content])
    @term.save
    respond_with @term
  end

  def update
    @term = Term.where params[:id]
    @term.revisions << Revision.new(content: term[:content])
    @term.save
    respond_with @term
  end

  private

  def term
    params.require(:term).permit(:content)
  end


end
