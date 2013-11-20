require 'spec_helper'

feature 'User registers', { js: true, vcr: true } do
  background do
    visit register_path
  end

  scenario "with valid user info and valid card" do
    fill_in_valid_user_info
    fill_in_valid_card
    click_button "sign up"
    expect(page).to have_content("thankz for registering for bootlegz .. please sign in now")
  end
  scenario "with valid user info and invalid card" do
    fill_in_valid_user_info
    fill_in_invalid_card
    click_button "sign up"
    expect(page).to have_content("This card number looks invalid")
  end

  scenario "with valid user info and declined card" do
    fill_in_valid_user_info
    fill_in_declined_card
    click_button "sign up"
    expect(page).to have_content("Your card was declined.")
  end

  scenario "with invalid user info and valid card" do
    fill_in_invalid_user_info
    fill_in_valid_card
    click_button "sign up"
    expect(page).to have_content("invalid user info .. please check the errors below")
  end

  scenario "with invalid user info and invalid card" do
    fill_in_invalid_user_info
    fill_in_invalid_card
    click_button "sign up"
    expect(page).to have_content("This card number looks invalid")
  end

  scenario "with invalid user info and declined card" do
    fill_in_invalid_user_info
    fill_in_declined_card
    click_button "sign up"
    expect(page).to have_content("invalid user info .. please check the errors below")
  end

  def fill_in_valid_user_info
    fill_in "email address", with: "tyler@example.com"
    fill_in "password", with: "123456"
    fill_in "full name", with: "tyler durdan"
  end

  def fill_in_valid_card
    fill_in "credit card number", with: "4242424242424242"
    fill_in "security code", with: "123"
    select "7 - July", from: "date_month"
    select "2015", from: "date_year"
  end

  def fill_in_invalid_card
    fill_in "credit card number", with: "123"
    fill_in "security code", with: "123"
    select "7 - July", from: "date_month"
    select "2015", from: "date_year"
  end

  def fill_in_declined_card
    fill_in "credit card number", with: "4000000000000002"
    fill_in "security code", with: "123"
    select "7 - July", from: "date_month"
    select "2015", from: "date_year"
  end

  def fill_in_invalid_user_info
    fill_in "email address", with: "tyler@example.com"
  end
end
