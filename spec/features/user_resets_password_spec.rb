require 'spec_helper'

feature 'user resets password' do
  scenario 'user successfully resets the password' do
    alice = Fabricate(:user, password: 'old_password')
    visit sign_in_path
    click_link "forgot password?"
    fill_in "email address", with: alice.email
    click_button "send email"

    open_email(alice.email)
    current_email.click_link("reset my password")

    fill_in "new password", with: "new_password"
    click_button "reset password"

    fill_in "email address", with: alice.email
    fill_in "password", with: "new_password"
    click_button "sign in"
    expect(page).to have_content("wah gwan, #{alice.full_name}")

    clear_email
  end
end
