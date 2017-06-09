require 'rails_helper'

feature 'create a key', %{
  As an Authenticated User
  I want to create a new key
  So I can select that key for new dances.
  } do
  # Acceptance
  # User cannot create new keys unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new keys.

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_key = { name: "F#" }

  scenario 'authenticated user successfully create key
    with valid information' do
    sign_in anne
    visit keys_path
    click_link "New Key"

    expect(page).to have_current_path(new_key_path)

    fill_in 'Name', with: new_key[:name].to_s
    click_button "Create Key"
    visit keys_path

    expect(page).to have_content(new_key[:name])
  end

  scenario 'authenticated user fail to create key
    with invalid information' do
    sign_in anne
    visit keys_path
    click_link "New Key"
    fill_in 'Name', with: ""
    click_button "Create Key"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to create a key with unauthenticated user' do
    visit new_dance_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
