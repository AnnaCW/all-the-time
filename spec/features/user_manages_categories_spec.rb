require 'rails_helper'

feature "User manages categories" do

  scenario "creates a category" do
    user = create(:user)
    sign_in(user)

    visit categories_path

    fill_in "Name", with: "Rails Projects"
    click_on "Create"

    expect(page).to have_content("Rails Projects")
  end

  scenario "lists categories in alphabetical order" do
    user = create(:user)
    sign_in(user)

    create(:category, name: "A")
    create(:category, name: "C")
    create(:category, name: "b")

    visit categories_path

    within ".categories" do
      expect(page).to have_selector(
        "ul.categories-overview li:first-child", text: "A")
      expect(page).to have_selector(
        "ul.categories-overview li:nth-child(2)", text: "b")
      expect(page).to have_selector(
        "ul.categories-overview li:nth-child(3)", text: "C")
    end

  end
end
