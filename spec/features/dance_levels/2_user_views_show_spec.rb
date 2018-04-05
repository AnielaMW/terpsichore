require 'rails_helper'

feature 'view dance_levels#show', %{
  As a Guest
  I want to view the dance_levels#show
  So I can get all information about a dance_level.
  } do
  # Acceptance
  # When a guest visits a dance_level#show_path,
  # they should expect to see all details of a dance_level
  # When a guest clicks on a link from the dance_levels#index_path,
  # they should expect to see all details of a dance_level
  # Details must include Name and Description

  let!(:dance_level) { FactoryBot.create(:dance_level) }
  let!(:dance) { FactoryBot.create(:dance, dance_level_id: dance_level.id) }

  scenario 'sucessfully view a dance_level#show when entered directly' do
    visit dance_level_path(dance_level.id)

    expect(page).to have_content(dance_level.name)
    expect(page).to have_content(dance_level.description)
  end

  scenario 'sucessfully view a dance_level#show from dance_levels#index_path or
  dance_path' do
    visit dance_levels_path
    click_on dance_level.name

    expect(page).to have_current_path(dance_level_path(dance_level.id))

    visit dance_path(dance)
    click_on dance_level.name

    expect(page).to have_current_path(dance_level_path(dance_level.id))

    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
