require 'rails_helper'

feature "Organization admin views organization info" do
  scenario "admin views organization's users" do
    org = create(:organization)
    admin = create(:admin, organization_id: org.id)

    sign_in(admin)

    visit root_path

    click_on "Organization Reports"

    expect(current_path).to eq(organization_path(org.id))

    click_on "Users"

    expect(current_path).to eq(organization_users_path(org.id))

  end
end
