require 'rails_helper'

feature "User views reports" do
  scenario "user views daily report" do
    user = create(:user)
    create_list(:entry, 5, user: user, date: Date.today)

    sign_in(user)

    visit root_path

    click_on "Get Reports"

    expect(current_path).to eq(reports_path)

    within(".daily-report") do
      expect(page).to have_content("task1")
      expect(page).to have_content("task5")
    end

  end
end
