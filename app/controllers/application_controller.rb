class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end

end
