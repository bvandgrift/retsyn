class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  def authenticate
    head :status => 403 and return unless current_user
  end
  
  helper_method :current_user
  def current_user
    client_cert = request.env['SSL_CLIENT_CERT']
    return nil if client_cert.nil? || client_cert.blank?
    @current_user ||= User.find_by_public_key(client_cert)
  end
end
