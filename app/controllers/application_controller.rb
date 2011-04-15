require 'pp'
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  def authenticate
    head :status => 403 and return unless current_user
  end
  
  helper_method :current_user
  def current_user
    session[:user] ||= User.find_by_public_key(request.env['CLIENT_PUBLIC_KEY'])
  end
end
