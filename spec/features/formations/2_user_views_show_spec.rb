require 'rails_helper'

feature 'view formations#show', %{
  As a Guest
  I want to view the formations#show
  So I can get all information about a formation.
  } do
  # Acceptance
  # When a guest visits a formation#show_path,
  # they should expect to see all details of a formation
  # When a guest clicks on a link from the formations#index_path,
  # they should expect to see all details of a formation
  # Details must include Name and Description

  let!(:formation) { FactoryGirl.create(:formation) }
  let!(:dance) { FactoryGirl.create(:dance, formation_id: formation.id) }

  scenario 'sucessfully view a formation#show when entered directly' do
    visit formation_path(formation.id)

    expect(page).to have_content(formation.name)
    expect(page).to have_content(formation.description)
  end

  scenario 'sucessfully view a formation#show from formations#index_path or
  dance_path' do
    visit formations_path
    click_link formation.name.to_s

    expect(page).to have_current_path(formation_path(formation.id))

    visit dance_path(dance)
    click_link formation.name.to_s

    expect(page).to have_current_path(formation_path(formation.id))

    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
