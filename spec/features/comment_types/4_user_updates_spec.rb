require 'rails_helper'

feature 'update a comment_type', %{
  As an Admin User
  I want to update comment_types
  So I can edit comment_types that have been created.
  } do
  # Acceptance
  # User cannot edit comment_types unless user is signed-in
  # User cannot edit comment_types unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:comment_type) { FactoryGirl.create(:comment_type) }
  changes = { name: "Caller's Tip", description: "Tips for Callers" }
  let!(:anne) { FactoryGirl.create(:anne) }

  scenario 'admin user sucessfully update comment_type with
  valid information' do
    sign_in admin
    visit comment_type_path(comment_type.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_comment_type_path(comment_type))

    fill_in 'Name', with: changes[:name].to_s
    fill_in 'Description', with: changes[:description].to_s
    click_button "Update"

    expect(page).to have_current_path(comment_type_path(comment_type.id))
    expect(page).to have_content(changes[:name])
    expect(page).to have_content(changes[:description])
  end

  scenario 'admin user fail to update comment_type with invalid information' do
    sign_in admin
    visit comment_type_path(comment_type.id)
    click_link "Edit"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button "Update"

    expect(page).to have_content("Name can't be blank,
    Description can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit comment_type_path(comment_type.id)

    expect(page).not_to have_content("Edit")

    sign_in anne
    visit comment_type_path(comment_type.id)

    expect(page).not_to have_content("Edit")
  end
end
