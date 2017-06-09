require 'rails_helper'

feature 'delete a mood', %{
  As an Admin User
  I want to delete moods
  So I can delete moods.
  } do
  # Acceptance
  # User cannot delete moods unless user is signed-in
  # User cannot delete moods unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:mood) { FactoryGirl.create(:mood) }

  scenario 'sucessfully delete a mood when admin user' do
    sign_in admin
    visit mood_path(mood.id)
    click_link "Delete"

    expect(page).to have_current_path(moods_path)
    expect(page).not_to have_content(mood.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit mood_path(mood.id)
    expect(page).not_to have_content("Delete")
  end
end
