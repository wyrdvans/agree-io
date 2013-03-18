class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Trespasser do
    render '/shared/trespasser'
  end

  def about
  end

  protected

  helper_method :current_email

  def current_email
    session['current_user']['info']['email'] rescue nil
  end

end
