require 'rails_helper'

feature 'update a dance_level', %{
  As an Admin User
  I want to update dance_levels
  So I can edit dance_levels that have been created.
  } do
  # Acceptance
  # User cannot edit dance_levels unless user is signed-in
  # User cannot edit dance_levels unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:dance_level) { FactoryGirl.create(:dance_level) }
  changes = { name: "2 Couple Improper",
              description: "4 people the 1st Couple on wrong side of set." }

  scenario 'admin user sucessfully update dance_level with valid information' do
    sign_in admin
    visit dance_level_path(dance_level.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_dance_level_path(dance_level))

    fill_in 'Name', with: changes[:name].to_s
    fill_in 'Description', with: changes[:description].to_s
    click_button "Update"

    expect(page).to have_current_path(dance_level_path(dance_level.id))
    expect(page).to have_content(changes[:name])
    expect(page).to have_content(changes[:description])
  end

  scenario 'admin user fail to update dance_level with invalid information' do
    sign_in admin
    visit dance_level_path(dance_level.id)
    click_link "Edit"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button "Update"

    expect(page).to have_content("Name can't be blank,
    Description can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit dance_level_path(dance_level.id)

    expect(page).not_to have_content("Edit")
  end
end
