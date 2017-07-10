require 'rails_helper'

feature 'delete a tempo', %{
  As an Admin User
  I want to delete tempos
  So I can delete tempos.
  } do
  # Acceptance
  # User cannot delete tempos unless user is signed-in
  # User cannot delete tempos unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:tempo) { FactoryGirl.create(:tempo) }

  scenario 'sucessfully delete a tempo when admin user' do
    sign_in admin
    visit tempo_path(tempo.id)
expect(page).to have_selector(:link_or_button, "delete-tempo")
    click_on "Delete"

    expect(page).to have_current_path(tempos_path)
    expect(page).not_to have_content(tempo.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit tempo_path(tempo.id)
    expect(page).to have_no_selector(:link_or_button, "delete-tempo")
  end
end
