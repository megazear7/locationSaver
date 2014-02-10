require "spec_helper"

describe Place do

  context "place should" do

    it "be able to be added to the database" do
      place = create(:place)
      expect(Place.where(title: place.title, icon_url: place.icon_url)).to exist
    end

  end

end
