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

  scenario "user views entries" do
    user = create(:user)
    cat1 = create(:category, name: "Rails")
    cat2 = create(:category, name: "Java")
    create(:entry, user: user, category: cat1, value: 60, date: "2016-11-15")
    create(:entry, user: user, category: cat2, value: 30, date: "2016-11-12")
    create(:entry, user: user, category: cat2, value: 20, date: "2016-11-01")

    sign_in(user)

    visit entries_path

    within("tbody.entries tr:first-child") do
      expect(page).to have_content("Rails 60")
    end

    within("tbody.entries tr:nth-child(2)") do
      expect(page).to have_content("Java 30")
    end

    within("tbody.entries tr:nth-child(3)") do
      expect(page).to have_content("Java 20")
    end
  end

  scenario "user edits entry" do
    user = create(:user)
    cat1 = create(:category, name: "Rails")
    cat2 = create(:category, name: "Java")
    e1 = create(:entry, user: user, category: cat1, value: 60, date: "2016-11-15")
    create(:entry, user: user, category: cat2, value: 30, date: "2016-11-12")
    create(:entry, user: user, category: cat2, value: 20, date: "2016-11-01")

    sign_in(user)

    visit entries_path

    within("tbody.entries tr:first-child") do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_entry_path(e1))

    select "Java", from: "entry[category_id]"
    click_on "Update"

    expect(page).to have_content "Entry Updated!"

    expect(current_path).to eq(entries_path)

    within("tbody.entries") do
      expect(page).to_not have_content("Rails")
    end
  end
end
