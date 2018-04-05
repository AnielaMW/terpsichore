require 'rails_helper'

feature 'delete a key', %{
  As an Admin User
  I want to delete keys
  So I can delete keys.
  } do
  # Acceptance
  # User cannot delete keys unless user is signed-in
  # User cannot delete keys unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryBot.create(:admin) }
  let!(:key) { FactoryBot.create(:key) }

  scenario 'sucessfully delete a key when admin user' do
    sign_in admin
    visit key_path(key.id)
    click_on "Delete"

    expect(page).to have_current_path(keys_path)
    expect(page).not_to have_content(key.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit key_path(key.id)
    expect(page).to have_no_selector(:link_or_button, "delete-key")
  end
end
