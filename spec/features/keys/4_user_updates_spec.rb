require 'rails_helper'

feature 'update a key', %{
  As an Admin User
  I want to update keys
  So I can edit keys that have been created.
  } do
  # Acceptance
  # User cannot edit keys unless user is signed-in
  # User cannot edit keys unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:key) { FactoryGirl.create(:key) }
  changes = { name: "Bd" }

  scenario 'admin user sucessfully update key with valid information' do
    sign_in admin
    visit key_path(key.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_key_path(key))

    fill_in 'Name', with: changes[:name].to_s
    click_button "Update"

    expect(page).to have_current_path(key_path(key.id))
    expect(page).to have_content(changes[:name])
  end

  scenario 'admin user fail to update key with invalid information' do
    sign_in admin
    visit key_path(key.id)
    click_link "Edit"
    fill_in 'Name', with: ""
    click_button "Update"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit key_path(key.id)

    expect(page).not_to have_content("Edit")
  end
end
