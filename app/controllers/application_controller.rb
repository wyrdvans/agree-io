class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  respond_to :json, :html

  rescue_from Trespasser do |exception|
    @message = exception.message
    respond_with(@message) do |format|
      format.html { render '/shared/trespasser', status: 403 }
      format.json { render json: @message, status: 403 }
    end
  end

  def about
  end

  protected

  helper_method :current_email

  def current_email
    session['current_user']['info']['email'] rescue nil
  end

end
