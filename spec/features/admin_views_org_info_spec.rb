require 'rails_helper'

feature "Organization admin views organization info" do
  scenario "admin views organization's users and reports" do
    org = create(:organization)
    admin = create(:admin, organization_id: org.id)

    user_1 = create(:user, email: "user1@org.org", organization_id: org.id)
    user_2 = create(:user, email: "user2@org.org", organization_id: org.id)

    cat1 = create(:category, name: "Rails")
    cat2 = create(:category, name: "Java")

    create(:entry, user: user_1, category: cat1, value: 30)
    create(:entry, user: user_2, category: cat1, value: 25)
    create(:entry, user: user_2, category: cat2, value: 30)
    create(:entry, user: user_2, category: cat2, value: 60)


    other_users = 2.times do |n|
      create(:user, email: "user#{n}@other.com")
    end

    sign_in(admin)

    visit root_path

    click_on "Organization Reports"

    expect(current_path).to eq(organization_path(org.id))

    click_on "Users"

    expect(current_path).to eq(organization_users_path(org.id))

    within(".users-list") do
      expect(page).to have_content("@org.org")
      expect(page).to_not have_content("@other.com")
    end

    click_on "Organization Reports"
    click_on "Get Time Reports"

    expect(current_path).to eq(organization_reports_path(org.id))

    expect(page).to have_content("@org.org")
    expect(page).to_not have_content("@other.com")

    expect(page).to have_content("user1@org.org Rails 30")
    expect(page).to have_content("user2@org.org Java 90")
    expect(page).to have_content("user2@org.org Rails 25")
  end
end
