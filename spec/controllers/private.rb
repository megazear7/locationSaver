require 'spec_helper'
require 'factory_girl'
include Warden::Test::Helpers
Warden.test_mode!

describe PrivateController do

  before :each do
    @user = create(:user)
    login_as(@user, :scope => :user)
    sign_in @user
  end

  describe "GET private logged in" do

    it "renders the content template" do
      get :content
      expect(response).to render_template("content")
    end

    it "and the user should be logged in" do
      get :content
      expect(assigns(:user)).to eq(@user)
    end
    
  end

  describe "GET private logged out" do

    it "redirects to the new_user_session_path" do
      sign_out :user
      get :content
      expect(response).to redirect_to(new_user_session_path)
    end

    it "and the user should be logged out" do
      sign_out :user
      get :content
      expect(subject.current_user).to be_nil
    end

  end

  describe "GET item looged out" do

    it "redirects to the new_user_session_path" do
      sign_out :user
      get :item
      expect(response).to redirect_to(new_user_session_path)
    end

    it "and the user should be logged out" do
      sign_out :user
      get :item
      expect(subject.current_user).to be_nil
    end

  end

  describe "GET item logged in" do

    it "renders the item template" do
      get :item, name: "South Columbus", icon_url: "www.example.com"
      expect(response).to render_template("item")
    end

    it "and the user should be logged in" do
      get :item, name: "South Columbus", icon_url: "www.example.com"
      expect(assigns(:user)).to eq(@user)
    end
    
  end

end

















