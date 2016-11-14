require 'rails_helper'

feature "User views reports" do
  scenario "user views daily report" do
    user = create(:user)
    category_1 = create(:category, name: "Rails")
    category_2 = create(:category, name: "Java")

    create_list(:entry, 2, user: user, category: category_1,
                value: 30, date: Date.today)
    create_list(:entry, 3, user: user, category: category_2,
                value: 30, date: Date.today)

    sign_in(user)

    visit root_path

    click_on "Get Reports"

    expect(current_path).to eq(reports_path)

    within(".daily-report") do
      expect(page).to have_content("task1")
      expect(page).to have_content("task5")
    end

    within(".daily-totals") do
      expect(page).to have_content("Total 150")
      expect(page).to have_content("Java 90")
      expect(page).to have_content("Rails 60")
    end
  end

    scenario "user's reports do not include other user's entries" do
      user = create(:user)
      user_2 = create(:user, email: "other@gmail.com", password: "otherp")
      category_1 = create(:category, name: "Rails")
      category_2 = create(:category, name: "Java")

      create_list(:entry, 2, user: user, category: category_1,
                  value: 30, date: Date.today, description: "my task")
      create_list(:entry, 3, user: user_2, category: category_2,
                  value: 30, date: Date.today, description: "not my task")

      sign_in(user)

      visit root_path

      click_on "Get Reports"

      expect(current_path).to eq(reports_path)

      within(".daily-report") do
        expect(page).to have_content("my task")
        expect(page).to_not have_content("not my task")
      end

      within(".daily-totals") do
        expect(page).to have_content("Total 60")
        expect(page).to have_content("Rails 60")
        expect(page).to_not have_content("Java 90")
      end

  end
end
