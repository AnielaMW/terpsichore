require 'rails_helper'

feature 'view dance_levels#index', %{
  As a Guest
  I want to view the dance_levels#index
  So I can pick from all dance_levels.
  } do
  # Acceptance
  # When a guest visits the dance_levels#index_path,
  # they should expect to see a list of all dance_levels
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:level1) { FactoryBot.create(:dance_level, name: "Medium") }
  let!(:level2) { FactoryBot.create(:dance_level, name: "Easy") }
  let!(:level3) { FactoryBot.create(:dance_level, name: "Difficult") }

  scenario 'sucessfully view the dance_levels#index' do
    visit dance_levels_path

    dance_levels = page.all(".info-list article")

    expect(dance_levels[0]).to have_content(level1.name)
    expect(dance_levels[1]).to have_content(level2.name)
    expect(dance_levels[2]).to have_content(level3.name)
  end
end
