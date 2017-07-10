require 'rails_helper'

feature 'view comment_types#show', %{
  As a Guest
  I want to view the comment_types#show
  So I can get all information about a comment_type.
  } do
  # Acceptance
  # When a guest visits a comment_type#show_path,
  # they should expect to see all details of a comment_type
  # When a guest clicks on a link from the comment_types#index_path,
  # they should expect to see all details of a comment_type
  # Details must include Name and Description

  let!(:comment_type) { FactoryGirl.create(:comment_type) }

  scenario 'sucessfully view a comment_type#show when entered directly' do
    visit comment_type_path(comment_type.id)

    expect(page).to have_content(comment_type.name)
    expect(page).to have_content(comment_type.description)
  end

  scenario 'sucessfully view a comment_type#show
  from comment_types#index_path' do
    visit comment_types_path
    click_on comment_type.name.to_s

    expect(page).to have_current_path(comment_type_path(comment_type.id))
  end
end
