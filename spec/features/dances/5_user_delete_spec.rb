require 'rails_helper'

feature 'delete a dance', %{
  As an Authenticated User
  I want to delete my dances
  So I can delete dances I have created.
  } do
  # Acceptance
  # User cannot delete dances unless user is signed-in
  # User cannot delete dances unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  let!(:anne) { FactoryBot.create(:anne) }
  let!(:dance1) { FactoryBot.create(:dance, user_id: anne.id) }
  let!(:clay) { FactoryBot.create(:anne) }

  scenario 'sucessfully delete a dance when authenticated user' do
    sign_in anne
    visit dance_path(dance1.id)
    click_on "Delete"

    expect(page).to have_current_path(root_path)
    expect(page).not_to have_content(dance1.title)
  end

  scenario 'fail to see "Delete" button with unauthenticated or not creator
  user' do
    visit dance_path(dance1.id)
    expect(page).to have_no_selector(:link_or_button, "delete-dance")

    sign_in clay
    visit dance_path(dance1.id)
    expect(page).to have_no_selector(:link_or_button, "delete-dance")
  end
end
