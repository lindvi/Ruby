class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  rescue_from "ActiveRecord::RecordNotFound" do |exception|
  		render 'public/404'
  end
end
