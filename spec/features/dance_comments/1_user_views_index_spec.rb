require 'rails_helper'

feature 'view dance comments', %{
  As a Guest
  I want to view the dance page and see it's comments
  So I can see from all dance_comments for a dance.
  } do
  # Acceptance
  # When a guest visits a dance
  # they should expect to see a list of all dance_comments
  # The list should be sorted soonest to oldest
  # The dance_comments#index should list all comments from all dance_comments
  # The list should be sorted by soonest to oldest
  # The both lists should include the comment_type, user, and comment
  # The indexes list should include the dance.title

  let!(:dance) { FactoryBot.create(:dance) }
  let!(:com1) { FactoryBot.create(:dcom_comment, dance_id: dance.id) }
  let!(:com2) { FactoryBot.create(:dvar_comment, dance_id: dance.id) }
  let!(:com3) { FactoryBot.create(:dstyle_comment, dance_id: dance.id) }
  let!(:com4) { FactoryBot.create(:dance_comment) }

  scenario 'sucessfully view the dance_comments for a given dance' do
    visit dance_path(dance)

    comments = page.all("article.comment-box")

    expect(comments[0]).to have_content(com3.comment)
    expect(comments[0]).to have_content(com3.user.user_name)
    expect(comments[0]).to have_content(com3.comment_type.name)

    expect(comments[1]).to have_content(com2.comment)
    expect(comments[1]).to have_content(com2.user.user_name)
    expect(comments[1]).to have_content(com2.comment_type.name)

    expect(comments[2]).to have_content(com1.comment)
    expect(comments[2]).to have_content(com1.user.user_name)
    expect(comments[2]).to have_content(com1.comment_type.name)
  end

  scenario 'sucessfully view the dance_comments for all dances on
  dance_comment#index' do
    visit dance_comments_path

    comments = page.all("article.comment-box")

    expect(comments[0]).to have_content(com4.dance.title)
    expect(comments[0]).to have_content(com4.comment)
    expect(comments[0]).to have_content(com4.user.user_name)
    expect(comments[0]).to have_content(com4.comment_type.name)

    expect(comments[1]).to have_content(com3.dance.title)
    expect(comments[1]).to have_content(com3.comment)
    expect(comments[1]).to have_content(com3.user.user_name)
    expect(comments[1]).to have_content(com3.comment_type.name)

    expect(comments[2]).to have_content(com2.dance.title)
    expect(comments[2]).to have_content(com2.comment)
    expect(comments[2]).to have_content(com2.user.user_name)
    expect(comments[2]).to have_content(com2.comment_type.name)

    expect(comments[3]).to have_content(com1.dance.title)
    expect(comments[3]).to have_content(com1.comment)
    expect(comments[3]).to have_content(com1.user.user_name)
    expect(comments[3]).to have_content(com1.comment_type.name)

    visit root_path
    click_on "Comments"

    comments = page.all("article.comment-box")

    expect(comments[0]).to have_content(com4.dance.title)
    expect(comments[0]).to have_content(com4.comment)
    expect(comments[0]).to have_content(com4.user.user_name)
    expect(comments[0]).to have_content(com4.comment_type.name)

    expect(comments[1]).to have_content(com3.dance.title)
    expect(comments[1]).to have_content(com3.comment)
    expect(comments[1]).to have_content(com3.user.user_name)
    expect(comments[1]).to have_content(com3.comment_type.name)

    expect(comments[2]).to have_content(com2.dance.title)
    expect(comments[2]).to have_content(com2.comment)
    expect(comments[2]).to have_content(com2.user.user_name)
    expect(comments[2]).to have_content(com2.comment_type.name)

    expect(comments[3]).to have_content(com1.dance.title)
    expect(comments[3]).to have_content(com1.comment)
    expect(comments[3]).to have_content(com1.user.user_name)
    expect(comments[3]).to have_content(com1.comment_type.name)

    # EVENTUALLY, TYPES WILL BE SORTED INTO DIFFERNET VIEWS
  end
end
