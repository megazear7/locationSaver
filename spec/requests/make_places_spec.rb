require 'spec_helper'
require 'factory_girl'

describe "MakePlaces", :type => :feature do
  it "create place for user when user complete place creation form" do
    user = FactoryGirl.create(:user)
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
end
