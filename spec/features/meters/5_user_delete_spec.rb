require 'rails_helper'

feature 'delete a meter', %{
  As an Admin User
  I want to delete meters
  So I can delete meters.
  } do
  # Acceptance
  # User cannot delete meters unless user is signed-in
  # User cannot delete meters unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:meter) { FactoryGirl.create(:meter) }

  scenario 'sucessfully delete a meter when admin user' do
    sign_in admin
    visit meter_path(meter.id)
    click_link "Delete"

    expect(page).to have_current_path(meters_path)
    expect(page).not_to have_content(meter.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit meter_path(meter.id)
    expect(page).not_to have_content("Delete")
  end
end
