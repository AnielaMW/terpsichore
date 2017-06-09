require 'rails_helper'

feature 'create a mood', %{
  As an Authenticated User
  I want to create a new mood
  So I can select that mood for new dances.
  } do
  # Acceptance
  # User cannot create new moods unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new moods.

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_mood = { name: "Flirty" }

  scenario 'authenticated user successfully create mood
    with valid information' do
    sign_in anne
    visit moods_path
    click_link "New Mood"

    expect(page).to have_current_path(new_mood_path)

    fill_in 'Name', with: new_mood[:name]
    click_button "Create Mood"
    visit moods_path

    expect(page).to have_content(new_mood[:name])
  end

  scenario 'authenticated user fail to create mood
    with invalid information' do
    sign_in anne
    visit moods_path
    click_link "New Mood"
    fill_in 'Name', with: ""
    click_button "Create Mood"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to create a mood with unauthenticated user' do
    visit new_dance_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
