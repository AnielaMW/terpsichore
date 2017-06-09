require 'rails_helper'

feature 'create a tempo', %{
  As an Authenticated User
  I want to create a new tempo
  So I can select that tempo for new dances.
  } do
  # Acceptance
  # User cannot create new tempos unless user is signed-in
  # User must povide Name and Desription
  # If user is not signed-in they cannot see the link to add new tempos.

  let!(:anne) { FactoryGirl.create(:admin) }
  let!(:dance) { FactoryGirl.create(:dance) }
  new_tempo = { name: "Flirty", description: "Romantic, but fun." }

  scenario 'admin user successfully create tempo
    with valid information' do
    sign_in anne
    visit tempos_path
    click_link "New Tempo"

    expect(page).to have_current_path(new_tempo_path)

    fill_in 'Name', with: new_tempo[:name]
    fill_in 'Description', with: new_tempo[:description]
    click_button "Create Tempo"
    visit tempos_path

    expect(page).to have_content(new_tempo[:name])
  end

  scenario 'admin user fail to create tempo
    with invalid information' do
    sign_in anne
    visit tempos_path
    click_link "New Tempo"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_button "Create Tempo"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to create a tempo with non-admin user' do
    visit new_dance_path

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
