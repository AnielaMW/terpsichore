require 'rails_helper'

feature 'delete a dance_level', %{
  As an Admin User
  I want to delete dance_levels
  So I can delete dance_levels.
  } do
  # Acceptance
  # User cannot delete dance_levels unless user is signed-in
  # User cannot delete dance_levels unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:dance_level) { FactoryGirl.create(:dance_level) }

  scenario 'sucessfully delete a dance_level when admin user' do
    sign_in admin
    visit dance_level_path(dance_level.id)
    click_on "Delete"

    expect(page).to have_current_path(dance_levels_path)
    expect(page).not_to have_content(dance_level.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit dance_level_path(dance_level.id)
    expect(page).to have_no_selector(:link_or_button, "delete-dance-level")
  end
end
