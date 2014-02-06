class PlacesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @place = Place.new
  end

  def create
    @user = current_user
    @place = @user.places.create(place_params)
    @place.save
    redirect_to user_path(@user)
  end

  def create_scratch
    @user = current_user
    @title = params[:title]
    @icon_url = params[:icon_url]
    @place = @user.places.create(:title => @title, :icon_url => @icon_url)
    redirect_to user_path(@user)
  end

  def destroy
    @user = current_user
    @user.places.destroy(params[:id])
    redirect_to user_path(@user)
  end

  private
    def place_params
      params.require(:place).permit(:title, :icon_url)
    end

end
