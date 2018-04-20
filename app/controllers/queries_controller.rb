class QueriesController < ApplicationController

  def create
    query = Query.create(query_params)
    if query.valid?
    	QueryMailer.new_query_email(query).deliver_now
      stats = Statistic.where(year: @current_year).last
      stats.queries = stats.queries + 1
      stats.save
    end
    redirect_to root_path
  end

  private

    def query_params
      params.require(:query).permit(:name, :email, :phone_number, :message)
    end

    def scoped_collection
      super.order(id: :asc)
    end

end
