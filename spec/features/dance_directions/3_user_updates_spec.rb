require 'rails_helper'

feature 'update a dance_direction', %{
  As an Authenticated User
  I want to update my dance_directions
  So I can edit dance_directions I have created.
  } do
  # Acceptance
  # User cannot edit dance_directions unless user is signed-in
  # User cannot edit dance_directions unless they are the creator
  # User must povide Direction, Sequence
  # User may provide Mark, Measure, Position
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not the creator, they cannot see the 'Edit' button

  let!(:dir1) { FactoryGirl.create(:dd) }
  let!(:dir2) { FactoryGirl.create(:dd, dance_id: dir1.dance_id) }
  let!(:dir3) { FactoryGirl.create(:dd, dance_id: dir1.dance_id) }
  changes = { direction: "set and turn single" }
  let!(:clay) { FactoryGirl.create(:anne) }

  scenario 'creator sucessfully update dance_direction with valid
  information from dance_direction_path' do
    sign_in dir1.user
    visit dance_path(dir1.id)
    click_link "Edit"

    expect(page).to have_current_path(edit_dance_dance_direction_path(dir1))

    fill_in 'Direction', with: changes[:direction].to_s
    click_button "Update"

    expect(page).to have_current_path(dance_direction_path(dir1.id))
    expect(page).to have_content(changes[:direction])
  end

  scenario 'creator sucessfully select edit button from the dance path' do
    sign_in dir2.user
    visit dance_path(dir2.dance)

    direction_boxes = page.all("article.direction-box")

    expect(direction_boxes[1]).to have_content("Edit")
  end

  scenario 'authorized user fail to update dance_direction with invalid
  information' do
    sign_in dir1.user
    visit dance_dance_direction_path(dir1.id)
    click_link "Edit"
    fill_in 'Direction', with: ""
    click_button "Update"

    expect(page).to have_content("Direction can't be blank")
  end

  scenario 'fail to see "Edit" button with unauthorized user' do
    visit dance_dance_direction_path(dir1.id)

    expect(page).not_to have_content("Edit")
  end

  scenario 'fail to see "Edit" button if authenticated user is not the
  creator' do
    sign_in clay
    visit dance_dance_direction_path(dir1.id)

    expect(page).not_to have_content("Edit")
  end
end
