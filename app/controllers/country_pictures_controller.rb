class CountryPicturesController < ApplicationController

  def new
    @picture = CountryPicture.new
  end

  def show
    @picture = CountryPicture.joins(:country).where("countries.slug = ?", params[:id]).last
    if @picture != nil && @picture.image.try(:url).present?
      redirect_to @picture.image.url
    else
      render "/country_pictures/not_yet"
    end
  end

  def create
    @picture = CountryPicture.new(country_picture_params)

    if @picture.save
      redirect_to action: :show, id: @picture.slug
    else 
      render :new
    end
  end

  private

    def country_picture_params
      params.require(:country_picture).permit(permitted_attributes)
    end

    def permitted_attributes
      [
        :image, :country_id
      ]
    end

end
