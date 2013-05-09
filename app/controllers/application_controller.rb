require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_filter :permission, unless: :devise_controller?
  protect_from_forgery
  
  private
  
  def permission
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Please sign in first'
    end
  end
end
