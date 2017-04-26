class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper ApplicationHelper

  protect_from_forgery with: :exception
  before_filter :set_current_year

  def set_current_year
    @current_year = Date.today.year
  end
end
