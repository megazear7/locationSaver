require 'spec_helper'
require 'factory_girl'

describe "MakePlaces", :type => :feature do
  it "create place for user when user complete place creation form" do
    user = FactoryGirl.build(:user)
    visit root_path
    puts current_path
    puts current_url


    #click_link "Log In"
    #click_link "Create A New Place"
    #fill_in "Title", :with => "Test Title"
    #fill_in "place[icon_url]", :with => "www.example_icon_url.com"
    #click_button "submit"
  end
end
