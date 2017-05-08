class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper ApplicationHelper

  protect_from_forgery with: :exception
  before_filter :set_current_year
  before_filter :set_views

  def set_current_year
    @current_year = Date.today.year
  end

  def set_views
    stats = Statistic.where(year: @current_year).last
    stats.views = stats.views + 1
    stats.save
  end
end
