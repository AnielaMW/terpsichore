require 'rails_helper'

feature 'update a meter', %{
  As an Admin User
  I want to update meters
  So I can edit meters that have been created.
  } do
  # Acceptance
  # User cannot edit meters unless user is signed-in
  # User cannot edit meters unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:meter) { FactoryGirl.create(:meter) }
  changes = { name: "3/7" }

  scenario 'admin user sucessfully update meter with valid information' do
    sign_in admin
    visit meter_path(meter.id)
    click_on "Edit"

    expect(page).to have_current_path(edit_meter_path(meter))

    fill_in 'Name', with: changes[:name].to_s
    click_on "Update"

    expect(page).to have_current_path(meter_path(meter.id))
    expect(page).to have_content(changes[:name])
  end

  scenario 'admin user fail to update meter with invalid information' do
    sign_in admin
    visit meter_path(meter.id)
    click_on "Edit"
    fill_in 'Name', with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit meter_path(meter.id)

    expect(page).to have_no_selector(:link_or_button, "edit-meter")
  end
end
