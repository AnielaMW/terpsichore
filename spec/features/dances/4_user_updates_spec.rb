require 'rails_helper'

feature 'update a dance', %{
  As an Authenticated User
  I want to update my dances
  So I can edit dances I have created.
  } do
  # Acceptance
  # User cannot edit dances unless user is signed-in
  # User cannot edit dances unless they are the creator
  # User must povide Title, Formation, Meter
  # User may provide Choreographer, Year, Publication
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not the creator, they cannot see the 'Edit' button

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance1) { FactoryGirl.create(:dance, user_id: anne.id) }
  let!(:dance2) { FactoryGirl.create(:choreographed, user_id: anne.id) }
  changes = { title: "My New Dance",
              choreographer: "Louisa M.",
              publication: "Dance Books",
              year: "2016" }
  let!(:clay) { FactoryGirl.create(:anne) }

  scenario 'authenticated user sucessfully update dance with valid
  information' do
    sign_in anne
    visit dance_path(dance1.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_dance_path(dance1))

    fill_in 'Title', with: changes[:title].to_s
    click_button "Update"

    expect(page).to have_current_path(dance_path(dance1.id))
    expect(page).to have_content(changes[:title])
    expect(page).to have_content(anne.first_name)
  end

  scenario 'authenticated user sucessfully update dance to all information' do
    sign_in anne
    visit dance_path(dance1.id)
    click_link "Edit"
    fill_in 'Choreographer', with: changes[:choreographer].to_s
    fill_in 'Year', with: changes[:year].to_s
    fill_in 'Publication', with: changes[:publication].to_s
    click_button "Update"

    expect(page).to have_current_path(dance_path(dance1.id))
    expect(page).to have_content(changes[:choreographer])
    expect(page).to have_content(changes[:publication])
    expect(page).to have_content(changes[:year])
  end

  scenario 'authenticated user sucessfully update dance with all information' do
    sign_in anne
    visit dance_path(dance2.id)
    click_link "Edit"
    fill_in 'Title', with: changes[:title].to_s
    fill_in 'Choreographer', with: changes[:choreographer].to_s
    fill_in 'Year', with: changes[:year].to_s
    fill_in 'Publication', with: changes[:publication].to_s
    click_button "Update"

    expect(page).to have_current_path(dance_path(dance2.id))
    expect(page).to have_content(changes[:title])
    expect(page).to have_content(anne.first_name)
    expect(page).to have_content(changes[:choreographer])
    expect(page).to have_content(changes[:publication])
    expect(page).to have_content(changes[:year])
  end

  scenario 'authenticated user fail to update dance with invalid information' do
    sign_in anne
    visit dance_path(dance1.id)
    click_link "Edit"
    fill_in 'Title', with: ""
    click_button "Update"

    expect(page).to have_content("Edit Dance")
  end

  scenario 'fail to see "Edit" button with unauthenticated or non-creator
  user' do
    visit dance_path(dance1.id)

    expect(page).not_to have_content("Edit")

    sign_in clay
    visit dance_path(dance1.id)

    expect(page).not_to have_content("Edit")
  end
end
