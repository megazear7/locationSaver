require 'spec_helper'
require 'factory_girl'
include Warden::Test::Helpers
Warden.test_mode!

describe HomeController do
  describe "GET index" do

    it "renders the index template" do
      user = create(:user)
      login_as(user, :scope => :user)
      get :index
      expect(response).to render_template("index")
      puts "hello"
      puts @test
      puts "hello"
    end
  end
end
