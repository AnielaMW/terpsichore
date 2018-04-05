require 'rails_helper'

feature 'create a meter', %{
  As an Authenticated User
  I want to create a new meter
  So I can select that meter for new dances.
  } do
  # Acceptance
  # User cannot create new meters unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new meters.

  let!(:anne) { FactoryBot.create(:anne) }
  let!(:dance) { FactoryBot.create(:dance) }
  new_meter = { name: "1/2" }

  scenario 'authenticated user successfully create meter
    with valid information' do
    sign_in anne
    visit meters_path
    click_on "Create Meter"

    expect(page).to have_current_path(new_meter_path)

    fill_in 'Name', with: new_meter[:name].to_s
    click_on "Create Meter"
    visit meters_path

    expect(page).to have_content(new_meter[:name])
  end

  scenario 'authenticated user fail to create meter
    with invalid information' do
    sign_in anne
    visit meters_path
    click_on "Create Meter"
    fill_in 'Name', with: ""
    click_on "Create Meter"

    expect(page).to have_content(
      "Name can't be blank"
    )
  end

  scenario 'fail to create a meter with unauthenticated user' do
    visit new_meter_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
