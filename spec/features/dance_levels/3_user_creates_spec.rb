require 'rails_helper'

feature 'create a dance_level', %{
  As an Authenticated User
  I want to create a new dance_level
  So I can select that dance_level for new dances.
  } do
  # Acceptance
  # User cannot create new dance_levels unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new dance_levels.

  let!(:anne) { FactoryGirl.create(:admin) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_dance_level = { name: "6 Couple", description: "3 next to 3" }

  scenario 'admin user successfully create dance_level
    with valid information' do
    sign_in anne
    visit dance_levels_path
    click_link "New Level"

    expect(page).to have_current_path(new_dance_level_path)

    fill_in 'Name', with: new_dance_level[:name].to_s
    fill_in 'Description', with: new_dance_level[:description].to_s
    click_button "Create Dance level"
    visit dance_levels_path

    expect(page).to have_content(new_dance_level[:name])
  end

  scenario 'admin user fail to create dance_level
    with invalid information' do
    sign_in anne
    visit dance_levels_path
    click_link "New Level"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button "Create Dance level"

    expect(page).to have_content(
      "Name can't be blank, Description can't be blank"
    )
  end

  scenario 'fail to create a dance_level with non-admin user' do
    visit new_dance_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
