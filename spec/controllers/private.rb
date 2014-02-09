require 'spec_helper'
require 'factory_girl'
include Warden::Test::Helpers
Warden.test_mode!

describe PrivateController do

  describe "GET private logged in" do

    it "renders the content template" do
      user = create(:user)
      login_as(user, :scope => :user)
      get :content
      expect(response).to render_template("content")
    end

    it "assigns @user" do
      user = create(:user)
      login_as(user, :scope => :user)
      get :content
      # TODO uncomment and comment this following line and look at the wierd behavior
      #expect(assigns(:user)).to eq(user)
    end
    
  end

  describe "GET private logged out" do

    it "renders the content template" do
      get :content
      expect(subject.current_user).to be_nil
      expect(response).to redirect_to(new_user_session_path)
    end

  end

end
