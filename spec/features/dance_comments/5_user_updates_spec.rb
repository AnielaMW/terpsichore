require 'rails_helper'

feature 'update a dance_comment', %{
  As an Authenticated User
  I want to update my dance_comments
  So I can edit dance_comments I have created.
  } do
  # Acceptance
  # User cannot edit dance_comments unless user is signed-in
  # User cannot edit dance_comments unless they are the creator
  # User must povide Title, Formation, Meter, Dance_Instructions
  # User may provide Choreographer, Year, Publication
  # If user is not signed-in, they cannot see the 'Edit' button
  # If user is not the creator, they cannot see the 'Edit' button

  let!(:com1) { FactoryGirl.create(:dstyle_comment) }
  let!(:com2) { FactoryGirl.create(:dstyle_comment, dance_id: com1.dance_id) }
  let!(:com3) { FactoryGirl.create(:dstyle_comment) }
  let!(:type) { FactoryGirl.create(:comment_type) }
  changes = { comment: "My New Fav Dance" }
  let!(:clay) { FactoryGirl.create(:anne) }

  scenario 'creator sucessfully update dance_comment with valid
  information from dance_path' do
    sign_in com1.user
    visit dance_comment_path(com1.id)
    click_on "Edit"

    expect(page).to have_current_path(edit_dance_comment_path(com1))

    fill_in 'Comment', with: changes[:comment].to_s
    select type.name.to_s, from: 'Type'
    click_on "Update"

    expect(page).to have_current_path(dance_comment_path(com1.id))
    expect(page).to have_content(changes[:comment])
    expect(page).to have_content(com1.user.user_name)
    expect(page).to have_content(type.name)
  end

  scenario 'creator sucessfully select edit button from the dance path' do
    sign_in com2.user
    visit dance_path(com2.dance)

    comment_boxes = page.all("article.comment-box")

    expect(comment_boxes[0]).to have_selector(:link_or_button, "edit-comment")
  end

  scenario 'creator sucessfully select edit button from the dance_comments
  path' do
    sign_in com3.user
    visit dance_comments_path

    comment_boxes = page.all("article.comment-box")

    expect(comment_boxes[0]).to have_selector(:link_or_button, "edit-comment")
  end

  scenario 'authenticated user fail to update dance_comment with invalid
  information' do
    sign_in com1.user
    visit dance_comment_path(com1.id)
    click_on "Edit"
    fill_in 'Comment', with: ""
    # select "", from: 'Type'
    click_on "Update"

    expect(page).to have_content("Comment can't be blank")
  end

  scenario 'fail to see "Edit" button with unauthenticated user' do
    visit dance_comment_path(com1.id)

    expect(page).to have_no_selector(:link_or_button, "edit-comment")
  end

  scenario 'fail to see "Edit" button if authenticated user is not the
  creator' do
    sign_in clay
    visit dance_comment_path(com1.id)

    expect(page).to have_no_selector(:link_or_button, "edit-comment")
  end
end
