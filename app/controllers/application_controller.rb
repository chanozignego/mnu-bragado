class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper ApplicationHelper

  protect_from_forgery with: :exception
  #protect_from_forgery prepend: true
  before_filter :set_current_year
  before_filter :set_views
  before_filter :set_social_network_sizes

  def set_current_year
    @current_year = Date.today.year
  end

  def set_views
    stats = Statistic.where(year: @current_year).last
    stats.views = stats.views + 1
    stats.save
  end

  def set_social_network_sizes
    @sn_sizes = { small: {
                    facebook: {width: 500, height: 1100},
                    instagram: {width: 700, height: 700},
                    twitter: {width: 700, height: 1100}
                  }, 
                  medium: {
                    facebook: {width: 500, height: 500},
                    instagram: {width: 500, height: 400},
                    twitter: {width: 500, height: 500}
                  }, 
                  large: {
                    facebook: {width: 300, height: 500},
                    instagram: {width: 300, height: 400},
                    twitter: {width: 300, height: 500}
                  }
                }
  end
end
