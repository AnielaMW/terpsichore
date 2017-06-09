require 'rails_helper'

feature 'create a dance_comment from dance#show', %{
  As an Authenticated User
  I want to create new dance_comments
  So I can share dance_comments with other users.
  } do
  # Acceptance
  # User cannot create new dance_comments unless user is signed-in
  # User must povide Comment, Comment_Type
  # If user is not signed-in and tries to create a new dance_comment,
  # they are redirected and prompted to sign-in
  # User comment should be added without a page reload

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:comment_type) { FactoryGirl.create(:comment_type) }
  new_dance_comment = { comment: "Really Great" }

  scenario 'authenticated user successfully create dance_comment
    with valid information from dance#show' do
    sign_in anne
    visit dance_path(dance)

    fill_in 'Comment', with: new_dance_comment[:comment].to_s
    select comment_type.name.to_s, from: 'Type'

      # How do I test no page reload like it was done in the Phase 9 grocery list
      # ajax challenge?????????????
      # expect_no_page_reload do
    click_button "Create Dance comment"

    expect(page).to have_content(new_dance_comment[:comment])
    expect(page).to have_content(anne.user_name)
    expect(page).to have_content(comment_type.name)
    expect(page).to have_content(dance.title)
      # end
  end

  scenario 'authenticated user fail to create dance_comment
    with invalid information from dance#show' do
    sign_in anne
    visit dance_path(dance)

    click_button "Create Dance comment"

    expect(page).to have_content("Comment can't be blank")
  end

  scenario 'fail to create a dance_comment with unauthenticated user from
    dance#show' do
    visit dance_path(dance)

    expect(page).not_to have_content("Create Dance comment")
  end
end
