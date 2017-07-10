require 'rails_helper'

feature 'update a mood', %{
  As an Admin User
  I want to update moods
  So I can edit moods that have been created.
  } do
  # Acceptance
  # User cannot edit moods unless user is signed-in
  # User cannot edit moods unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:mood) { FactoryGirl.create(:mood) }
  changes = { name: "Rowdy" }

  scenario 'admin user sucessfully update mood with valid information' do
    sign_in admin
    visit mood_path(mood.id)
    click_on "Edit"

    expect(page).to have_current_path(edit_mood_path(mood))

    fill_in 'Name', with: changes[:name].to_s
    click_on "Update"

    expect(page).to have_current_path(mood_path(mood.id))
    expect(page).to have_content(changes[:name])
  end

  scenario 'admin user fail to update mood with invalid information' do
    sign_in admin
    visit mood_path(mood.id)
    click_on "Edit"
    fill_in 'Name', with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit mood_path(mood.id)

    expect(page).to have_no_selector(:link_or_button, "edit-mood")
  end
end
