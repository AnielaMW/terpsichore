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

  let!(:admin) { FactoryBot.create(:admin) }
  let!(:key) { FactoryBot.create(:key) }
  changes = { name: "Bd" }

  scenario 'admin user sucessfully update key with valid information' do
    sign_in admin
    visit key_path(key.id)
    click_on "Edit"

    expect(page).to have_current_path(edit_key_path(key))

    fill_in 'Name', with: changes[:name].to_s
    click_on "Update"

    expect(page).to have_current_path(key_path(key.id))
    expect(page).to have_content(changes[:name])
  end

  scenario 'admin user fail to update key with invalid information' do
    sign_in admin
    visit key_path(key.id)
    click_on "Edit"
    fill_in 'Name', with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit key_path(key.id)

    expect(page).to have_no_selector(:link_or_button, "edit-key")
  end
end
