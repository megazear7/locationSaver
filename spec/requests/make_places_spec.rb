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
    Place.where(:title => "Test Title").should exist
  end

  it "creates a new place for the user" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit new_place_path
    title = "Test Title"
    fill_in "Title", :with => title
    fill_in "Icon url", :with => "www.example_icon_url.com"
    click_button "Create Place"
    page.should have_selector('h2', title)
    Place.where(:title => "Test Title").should exist
  end

  it "goes to the private page and adds place from the list" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit private_path
    title = first(:link).find('h2').text
    first(:link, "Add to My Places").click
    page.should have_selector('h2', title)
    Place.where(:title => title).should exist
  end

  it "creates a user manually" do
    visit root_path
    click_link "Sign up"
    fill_in "Email", :with => "tester_manual@example.com"
    fill_in "Password", :with => "abcdefghi"
    fill_in "Password confirmation", :with => "abcdefghi"
    click_button "Sign up"
    User.where(:email => "tester_manual@example.com").should exist
  end

end












