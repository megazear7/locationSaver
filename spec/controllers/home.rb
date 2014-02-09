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
    end

    it "assigns @user" do
      user = create(:user)
      login_as(user, :scope => :user)
      get :index
      expect(assigns(:user)).to eq(user)
    end

  end

  describe "GET home logged out" do

    it "renders the content template" do
      get :index
      expect(response).to render_template("index")
    end

  end


end
