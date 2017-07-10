require 'rails_helper'

feature 'update a tempo', %{
  As an Admin User
  I want to update tempos
  So I can edit tempos that have been created.
  } do
  # Acceptance
  # User cannot edit tempos unless user is signed-in
  # User cannot edit tempos unless they are admin
  # User must povide Name and Description
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not admin, they cannot see the 'Edit' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:tempo) { FactoryGirl.create(:tempo) }
  changes = { name: "Glacial",
              description: "Slower than a mountain of ice." }

  scenario 'admin user sucessfully update tempo with valid information' do
    sign_in admin
    visit tempo_path(tempo.id)
    click_on "Edit"

    expect(page).to have_current_path(edit_tempo_path(tempo))

    fill_in 'Name', with: changes[:name]
    fill_in 'Description', with: changes[:description]
    click_on "Update"

    expect(page).to have_current_path(tempo_path(tempo.id))
    expect(page).to have_content(changes[:name])
    expect(page).to have_content(changes[:description])
  end

  scenario 'admin user fail to update tempo with invalid information' do
    sign_in admin
    visit tempo_path(tempo.id)
    click_on "Edit"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'fail to see "Edit" button with non-admin user' do
    visit tempo_path(tempo.id)

    expect(page).to have_no_selector(:link_or_button, "edit-tempo")
  end
end
