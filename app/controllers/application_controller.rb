require "application_responder"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  self.responder = ApplicationResponder
  protect_from_forgery with: :exception
  respond_to :html
  responders :flash
end