require 'rails_helper'

feature "User manages entries" do
  scenario "user adds new entry" do
    user = create(:user)
    create_list(:category, 3)

    sign_in(user)

    visit root_path

    click_on "Add Entry"

    expect(current_path).to eq(new_entry_path)

    fill_in "Time (minutes)", with: "65"
    fill_in "Description", with: "this is a new entry"
    select "name1", from: "entry[category_id]"

    click_on "Create"

    expect(page).to have_content("Entry Saved")
    expect(current_path).to eq(root_path)
  end

  scenario "not logged in user cannot add entry" do
    user = create(:user)

    visit root_path

    expect(page).to_not have_content("Add Entry")

    visit new_entry_path

    expect(page).to have_content("You need to sign in or sign up before continuing")
  end
end
