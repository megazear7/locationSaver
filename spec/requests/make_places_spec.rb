require 'spec_helper'
require 'factory_girl'
include Warden::Test::Helpers
Warden.test_mode!

describe "MakePlaces", :type => :feature do

  it "logs in user and then follows links to create a place for user when user complete place creation form" do
    user = create(:user)
    visit root_path
    click_link "Log in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    click_link "Your Profile"
    click_link "Create A new Place"
    fill_in "Title", :with => "Test Title"
    fill_in "Icon url", :with => "www.example_icon_url.com"
    click_button "Create Place"
  end

  it "creates a new place for the user" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit new_place_path
    fill_in "Title", :with => "Test Title"
    fill_in "Icon url", :with => "www.example_icon_url.com"
    click_button "Create Place"
  end

  it "goes to the private page and adds place from the list" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit private_path
    first(:link, "Add to My Places").click
  end

end
