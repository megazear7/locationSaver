require "spec_helper"

describe User do

  context "user should have places" do

    it "orders them in reverse" do
      # this needs more work done
      post = Post.create
      user = create(:user)
      place = create(:place)
      user_place = user.places.create(place)
      user.places.should = [user_place]
    end

  end

end
