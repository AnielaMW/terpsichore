require 'rails_helper'

feature 'view comment_types#index', %{
  As a Guest
  I want to view the comment_types#index
  So I can pick from all comment_types.
  } do
  # Acceptance
  # When a guest visits the comment_types#index_path,
  # they should expect to see a list of all comment_types
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:type1) { FactoryBot.create(:variation) }
  let!(:type2) { FactoryBot.create(:comment_type) }
  let!(:type3) { FactoryBot.create(:style_point) }
  let!(:dance) { FactoryBot.create(:dance) }

  scenario 'sucessfully view the comment_types#index' do
    visit comment_types_path

    comment_types = page.all(".info-list article")

    expect(comment_types[0]).to have_content(type2.name)
    expect(comment_types[1]).to have_content(type3.name)
    expect(comment_types[2]).to have_content(type1.name)
  end
  
  # When a guest clicks the view button on the comment form,
  # they should expect to see a list of all comment_types
end
