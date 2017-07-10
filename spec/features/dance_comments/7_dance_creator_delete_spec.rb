require 'rails_helper'

feature 'delete a dance_comment', %{
  As an Dance Creator
  I want to delete dance_comments posted to my dance
  So I can delete dance_comments I don't want posted to my dance.
  } do
  # Acceptance
  # User cannot delete dance_comments unless user is signed-in
  # User cannot delete dance_comments unless they are the creator of the
  # parent dance

  let!(:dance) { FactoryGirl.create(:dance) }
  let!(:com1) { FactoryGirl.create(:dance_comment, dance_id: dance.id) }
  let!(:com2) { FactoryGirl.create(:dance_comment, dance_id: dance.id) }

  scenario 'dance_creator sucessfully delete a dance_comment from
  dance_comment_path' do
    sign_in dance.user
    visit dance_comment_path(com1.id)
    click_on "Delete"

    expect(page).to have_current_path(dance_path(com1.dance))
    expect(page).not_to have_content(com1.comment)
  end

  scenario 'dance_creator sucessfully delete a dance_comment from the dance
  path' do
    sign_in dance.user
    visit dance_path(com2.dance)

    comment_boxes = page.all("article.comment-box")

    expect(comment_boxes[0]).to have_selector(:link_or_button, "delete-comment")
    expect(comment_boxes[1]).to have_selector(:link_or_button, "delete-comment")
  end

  scenario 'dance_creator sucessfully delete a dance_comment from the
  dance_comments path' do
    sign_in dance.user
    visit dance_comments_path

    comment_boxes = page.all("article.comment-box")

    expect(comment_boxes[0]).to have_selector(:link_or_button, "delete-comment")
    expect(comment_boxes[1]).to have_selector(:link_or_button, "delete-comment")
  end
end
