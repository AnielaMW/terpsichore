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

  let!(:anne) { FactoryBot.create(:admin) }
  let!(:dance) { FactoryBot.create(:dance) }
  new_tempo = { name: "Flirty", description: "Romantic, but fun." }

  scenario 'admin user successfully create tempo
    with valid information' do
    sign_in anne
    visit tempos_path
    click_on "Create Tempo"

    expect(page).to have_current_path(new_tempo_path)

    fill_in 'Name', with: new_tempo[:name]
    fill_in 'Description', with: new_tempo[:description]
    click_on "Create Tempo"
    visit tempos_path

    expect(page).to have_content(new_tempo[:name])
  end

  scenario 'admin user fail to create tempo
    with invalid information' do
    sign_in anne
    visit tempos_path
    click_on "Create Tempo"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_on "Create Tempo"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to create a tempo with non-admin user' do
    visit tempos_path

    expect(page).to have_no_selector(:link_or_button, "create-tempo")

    sign_in anne
    visit comment_types_path

    expect(page).to have_no_selector(:link_or_button, "create-tempo")
  end
end
