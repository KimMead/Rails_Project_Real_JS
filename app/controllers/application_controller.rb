class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :logged_in?, :current_user, :set_user, :require_login

  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  
  def require_login
    if !logged_in?
      redirect_to signin_path
    end
  end
  
end

