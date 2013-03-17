class SessionsController < ApplicationController

  def create
    session[:current_user] = auth_hash
    redirect_to '/'
  end

  def new
    redirect_to '/auth/google_oauth2'
  end

  def show
    @session = session[:current_user]
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
