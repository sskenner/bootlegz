require 'spec_helper'

feature "Admin sees payments" do
  background do
    alice = Fabricate(:user, full_name: "Alice Doe", email: "alice@example.com")
    Fabricate(:payment, amount: 99, user: alice)
  end

  scenario "admin can see payments" do
    sign_in(Fabricate(:admin))
    visit admin_payments_path
    expect(page).to have_content("$0.99")
    expect(page).to have_content("Alice Doe")
    expect(page).to have_content("alice@example.com")
  end

  scenario "user cannot see payments" do
    sign_in(Fabricate(:user))
    visit admin_payments_path
    expect(page).not_to have_content("$0.99")
    expect(page).not_to have_content("Alice Doe")
    expect(page).to have_content("you know you arent autherized to do that")
  end
end
