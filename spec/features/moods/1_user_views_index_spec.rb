require 'rails_helper'

feature 'view moods#index', %{
  As a Guest
  I want to view the moods#index
  So I can pick from all moods.
  } do
  # Acceptance
  # When a guest visits the moods#index_path,
  # they should expect to see a list of all moods
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:mood1) { FactoryGirl.create(:mood, name: "Romantic") }
  let!(:mood2) { FactoryGirl.create(:mood, name: "Dramatic") }
  let!(:mood3) { FactoryGirl.create(:mood, name: "Flowing") }

  scenario 'sucessfully view the moods#index' do
    visit moods_path

    moods = page.all(".info-list article")

    expect(moods[0]).to have_content(mood2.name)
    expect(moods[1]).to have_content(mood3.name)
    expect(moods[2]).to have_content(mood1.name)
  end
end
