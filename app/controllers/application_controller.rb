class ApplicationController < ActionController::Base
  
  before_filter :authenticate
  
  protect_from_forgery
  
  private
  
  rescue_from ActiveRecord::RecordNotFound, :with => :do_404_error
  def do_404_error
    redirect_to "/404.html"
    return
  end
  
  def authenticate
    if (Rails.env=="production")
      authenticate_or_request_with_http_basic("Fest Scheduling Tool") do |username, password|
        username == "fest" && password == "f£ST!SG0"
      end
    end
  end
  
end
