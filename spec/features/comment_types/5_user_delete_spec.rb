require 'rails_helper'

feature 'delete a comment_type', %{
  As an Admin User
  I want to delete comment_types
  So I can delete comment_types.
  } do
  # Acceptance
  # User cannot delete comment_types unless user is signed-in
  # User cannot delete comment_types unless they are Admin
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not Admin, they cannot see the 'Delete' button

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:comment_type) { FactoryGirl.create(:comment_type) }
  let!(:anne) { FactoryGirl.create(:anne) }

  scenario 'sucessfully delete a comment_type when admin user' do
    sign_in admin
    visit comment_type_path(comment_type.id)
    click_link "Delete"

    expect(page).to have_current_path(comment_types_path)
    expect(page).not_to have_content(comment_type.name)
  end

  scenario 'fail to see "Delete" button with non-admin user' do
    visit comment_type_path(comment_type.id)

    expect(page).not_to have_content("Delete")

    sign_in anne
    visit comment_type_path(comment_type.id)

    expect(page).not_to have_content("Delete")
  end
end
