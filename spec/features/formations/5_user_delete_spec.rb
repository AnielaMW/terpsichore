require 'rails_helper'

feature 'delete a formation', %{
  As an Admin User
  I want to delete formations
  So I can delete formations.
  } do
  # Acceptance
  # User cannot delete formations unless user is signed-in
  # User cannot delete formations unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:formation) { FactoryGirl.create(:formation) }

  scenario 'sucessfully delete a formation when admin user' do
    sign_in admin
    visit formation_path(formation.id)
    click_link "Delete"

    expect(page).to have_current_path(formations_path)
    expect(page).not_to have_content(formation.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit formation_path(formation.id)
    expect(page).not_to have_content("Delete")
  end
end
