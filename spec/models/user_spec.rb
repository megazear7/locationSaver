require "spec_helper"

describe User do

  context "user should be able to have places" do

    it "user should be able to have one place" do
      user = create(:user)
      place = create(:place)
      user.places = [place]
      user.places.should eq([place])
    end

    it "user should be able to have more than one place" do
      user = create(:user)
      place_1 = create(:place)
      place_2 = create(:place)
      place_3 = create(:place)
      user.places = [place_1, place_2, place_3]
      user.places.should eq([place_1, place_2, place_3])
    end

  end

end
