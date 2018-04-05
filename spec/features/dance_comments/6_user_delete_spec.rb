require 'rails_helper'

feature 'delete a dance_comment', %{
  As an Authenticated User
  I want to delete my dance_comments
  So I can delete dance_comments I have created.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator
  # If user is not signed-in, they cannot see the 'Delete' button
  # If user is not the creator, they cannot see the 'Delete' button

  let!(:com1) { FactoryBot.create(:dance_comment) }
  let!(:com2) { FactoryBot.create(:dance_comment, dance_id: com1.dance_id) }
  let!(:com3) { FactoryBot.create(:dance_comment) }

  scenario 'creator sucessfully delete a dance_comment from
  dance_comment_path' do
    sign_in com1.user
    visit dance_comment_path(com1.id)
    click_on "Delete"

    expect(page).to have_current_path(dance_path(com1.dance))
    expect(page).not_to have_content(com1.comment)
  end

  scenario 'creator sucessfully delete a dance_comment from the dance path' do
    sign_in com2.user
    visit dance_path(com2.dance)
    click_on "Delete"

    expect(page).to have_current_path(dance_path(com2.dance))
    expect(page).not_to have_content(com2.comment)
  end

  scenario 'creator sucessfully delete a dance_comment from the dance_comments
  path' do
    sign_in com3.user
    visit dance_comments_path
    click_on "Delete"

    expect(page).to have_current_path(dance_path(com3.dance))
    expect(page).not_to have_content(com3.comment)
  end
end
