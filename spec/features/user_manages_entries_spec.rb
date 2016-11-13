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
end
