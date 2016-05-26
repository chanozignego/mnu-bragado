class QueriesController < ApplicationController

  def create
    query = Query.create(query_params)
    if query.valid?
    	#QueryMailer.new_query_email(query).deliver_now
    end
    redirect_to root_path
  end

  private

    def query_params
      params.require(:query).permit(:name, :email, :phone_number, :message)
    end

end
