class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_chef
    @current_chef ||= Chef.find_by(username: session[:chef_username]) if session[:chef_username]
  end
  helper_method :current_chef
end
