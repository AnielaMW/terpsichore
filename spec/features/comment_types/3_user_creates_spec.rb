require 'rails_helper'

feature 'create a comment_type', %{
  As a admin
  I want to create a new comment_type
  So I can select that comment_type for new dances.
  } do
  # Acceptance
  # User cannot create new comment_types unless user is signed-in and admin
  # User must povide Name and Desription
  # If user is not signed-in and admin they cannot see the link to
  # add new comment_types.

  let!(:admin) { FactoryGirl.create(:admin) }
  new_type = { name: "Caller's Tip", description: "Tips for Callers" }
  let!(:anne) { FactoryGirl.create(:anne) }

  scenario 'admin user successfully create comment_type
    with valid information' do
    sign_in admin
    visit comment_types_path
    click_on "Create Comment Type"

    expect(page).to have_current_path(new_comment_type_path)

    fill_in 'Name', with: new_type[:name].to_s
    fill_in 'Description', with: new_type[:description].to_s
    click_on "Create Comment type"

    expect(page).to have_content(new_type[:name])
    expect(page).to have_content(new_type[:description])
  end

  scenario 'admin user fail to create comment_type
    with invalid information' do
    sign_in admin
    visit comment_types_path
    click_on "Create Comment Type"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_on "Create Comment type"

    expect(page).to have_content(
      "Name can't be blank, Description can't be blank"
    )
  end

  scenario 'fail to see Create Comment Type button with unadmin user' do
    visit comment_types_path

    expect(page).to have_no_selector(:link_or_button, "create-comment-type")

    sign_in anne
    visit comment_types_path

    expect(page).to have_no_selector(:link_or_button, "create-comment-type")
  end
end
