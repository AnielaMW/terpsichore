require 'rails_helper'

feature 'create a dance_comment from dance_comment#new', %{
  As an Authenticated User
  I want to create new dance_comments
  So I can share dance_comments with other users.
  } do
  # Acceptance
  # User cannot create new dance_comments unless user is signed-in
  # User must povide Comment, Comment_Type
  # If user is not signed-in and tries to create a new dance_comment,
  # they are redirected and prompted to sign-in

  let!(:anne) { FactoryBot.create(:anne) }
  let!(:dance) { FactoryBot.create(:dance) }
  let!(:comment_type) { FactoryBot.create(:comment_type) }
  new_dance_comment = { comment: "Really Great" }

  scenario 'authenticated user successfully create dance_comment
    with valid information from dance_comment#new' do
    sign_in anne
    visit dance_path(dance)
    click_on "Create Comment"

    expect(page).to have_current_path(new_dance_dance_comment_path(dance))

    # How to fill_in in a test if I get rid of the Comment label?
    fill_in 'Comment', with: new_dance_comment[:comment].to_s
    select comment_type.name.to_s, from: 'Type'
    click_on "Create Dance comment"

    expect(page).to have_content(new_dance_comment[:comment])
    expect(page).to have_content(anne.user_name)
    expect(page).to have_content(comment_type.name)
    expect(page).to have_content(dance.title)
  end

  scenario 'authenticated user fail to create dance_comment
    with invalid information from dance_comment#new' do
    sign_in anne
    visit dance_path(dance)
    click_on "Create Comment"
    click_on "Create Dance comment"

    expect(page).to have_content("Comment can't be blank")
  end

  scenario 'fail to create a dance_comment with unauthenticated user from
    dance_comment#new' do
    visit dance_path(dance)
    click_on "Create Comment"

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
    expect(page).to have_current_path(new_user_session_path)
  end
end
