require 'rails_helper'

feature "User signs in" do

  scenario "signs in with valid credentials" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content "Logged in as #{user.email}"
  end

  scenario "cannot sign in with invalid credentials" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Log in"

    expect(page).to have_content "Login Invalid"
  end

end
