require 'rails_helper'

feature "User manages categories" do

  scenario "creates a category" do
    user = create(:user)

    visit categories_path
    
    fill_in "Name", with: "Rails Projects"
    click_on "Create"

    expect(page).to have_content("Rails Projects")
  end
end
