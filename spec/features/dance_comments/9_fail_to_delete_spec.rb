require 'rails_helper'

feature 'fail to delete a dance_comment', %{
  As an Unauthenticated User
  I want to delete my dance_comments
  So I can delete dance_comments I have created.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  let!(:clay) { FactoryBot.create(:anne) }
  let!(:com1) { FactoryBot.create(:dance_comment) }
  let!(:com2) { FactoryBot.create(:dance_comment, dance_id: com1.dance_id) }
  let!(:comment3) { FactoryBot.create(:dance_comment) }

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_comment_path' do
    visit dance_comment_path(com1.id)
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_comment_path' do
    sign_in clay
    visit dance_comment_path(com1.id)
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_path' do
    visit dance_path(com2.dance_id)
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_path' do
    sign_in clay
    visit dance_path(com2.dance_id)
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end

  scenario 'fail to see "Delete" button with unauthenticated user from
  dance_comments_path' do
    visit dance_comments_path
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end

  scenario 'fail to see "Delete" button if authenticated user is not the creator
  from dance_comments_path' do
    sign_in clay
    visit dance_comments_path
    expect(page).to have_no_selector(:link_or_button, "delete-comment")
  end
end
