require 'spec_helper'

feature 'User invites friend' do
  scenario 'User successfully invites friend and invitation is accepted', { js: true, vcr:true } do
    alice = Fabricate(:user)
    sign_in(alice)

    invite_a_friend
    friend_accepts_invitation
    friend_signs_in

    friend_should_follow(alice)
    inviter_should_follow_friend(alice)

    clear_email
  end

  def invite_a_friend
    visit new_invitation_path
    fill_in "friend's name", with: "john doe"
    fill_in "friend's email address", with: "john@example.com"
    fill_in "message", with: "hello, please join this site"
    click_button "send invitation"
    sign_out
  end

  def friend_accepts_invitation
    open_email "john@example.com"
    current_email.click_link "accept this invitation"
    fill_in "password", with: "password"
    fill_in "full name", with: "john doe"
    fill_in "credit card number", with: "4242424242424242"
    fill_in "security code", with: "123"
    select "7 - July", from: "date_month"
    select "2015", from: "date_year"
    click_button "sign up"
  end

  def friend_signs_in
    fill_in "email address", with: "john@example.com"
    fill_in "password", with: "password"
    click_button "sign in"
  end

  def friend_should_follow(user)
    click_link "peepz"
    expect(page).to have_content user.full_name
    sign_out
  end

  def inviter_should_follow_friend(inviter)
    sign_in(inviter)
    click_link "peepz"
    expect(page).to have_content "john doe"
  end
end
