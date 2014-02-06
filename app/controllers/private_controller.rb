class PrivateController < ApplicationController
  before_filter :authenticate_user!

  def content
    @user = current_user

    @content = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyAjnGcThGSaa0t7Zxlakj2HBfCqWo3jhs8&location=39.961176,-82.998794&radius=20000&sensor=false")	
  	@content_hash = JSON.load(JSON.dump(@content))
  	@list = []

  	@content_hash["results"].each do |x|
  		place = Place.new(:title => x["name"], :icon_url => x["icon"])
  		@list.push place
  	end

  	@results = @list.paginate(page: params[:page], per_page: 5)
  	render "content"
  end

  def item
    @user = current_user
  	@place = Place.new(:title => params[:name], :icon_url => params[:icon_url])

    search = @place.title.gsub(/ /, '+')
    @content = HTTParty.get("http://www.google.com/search?h1=en&q=#{search}&btnI=I")	

    @paragraph = @content[/<p>.*?<\/p>/]
  	if @paragraph
  	  @paragraph.gsub!(/<(.*?)>/, '')
  	end
  end

end
