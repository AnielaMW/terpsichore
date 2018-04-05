require 'rails_helper'

feature 'update a formation', %{
  As an Admin User
  I want to update formations
  So I can edit formations that have been created.
  } do
  # Acceptance
  # User cannot edit formations unless user is signed-in
  # User cannot edit formations unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryBot.create(:admin) }
  let!(:formation) { FactoryBot.create(:formation) }
  changes = { name: "2 Couple Improper",
              description: "4 people the 1st Couple on wrong side of set." }

  scenario 'admin user sucessfully update formation with valid information' do
    sign_in admin
    visit formation_path(formation.id)
expect(page).to have_selector(:link_or_button, "edit-formation")
    click_on "Edit"

    expect(page).to have_current_path(edit_formation_path(formation))

    fill_in 'Name', with: changes[:name].to_s
    fill_in 'Description', with: changes[:description].to_s
    click_on "Update"

    expect(page).to have_current_path(formation_path(formation.id))
    expect(page).to have_content(changes[:name])
    expect(page).to have_content(changes[:description])
  end

  scenario 'admin user fail to update formation with invalid information' do
    sign_in admin
    visit formation_path(formation.id)
    click_on "Edit"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank, Description can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit formation_path(formation.id)

    expect(page).to have_no_selector(:link_or_button, "edit-formation")
  end
end
