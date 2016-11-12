require 'rails_helper'

feature "User manages entries" do
  scenario "user adds new entry" do
    user = create(:user)

    sign_in(user)

    visit root_path

    click_on "Add Entry"

    expect(current_path).to eq(new_entry_path)

    fill_in "Hours", with: "3"
  end
end
