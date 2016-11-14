require 'rails_helper'

feature "Organization admin views organization info" do
  scenario "admin views organization's users and reports" do
    org = create(:organization)
    admin = create(:admin, organization_id: org.id)

    org_users = 3.times do |n|
      create(:user, email: "user#{n}@org.org", organization_id: org.id)
    end

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
  end
end
