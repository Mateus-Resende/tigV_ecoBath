class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper



  private

  def require_login
    if session[:user_id].present? && logged_in?
      true
    else
      redirect_to root_path
    end
  end
end
