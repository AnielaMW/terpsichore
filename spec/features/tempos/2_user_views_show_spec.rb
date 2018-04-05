require 'rails_helper'

feature 'view tempos#show', %{
  As a Guest
  I want to view the tempos#show
  So I can get all information about a tempo.
  } do
  # Acceptance
  # When a guest visits a tempo#show_path,
  # they should expect to see all details of a tempo
  # When a guest clicks on a link from the tempos#index_path,
  # they should expect to see all details of a tempo
  # Details must include Name and Description

  let!(:tempo) { FactoryBot.create(:tempo) }
  let!(:dance) { FactoryBot.create(:dance, tempo_id: tempo.id) }

  scenario 'sucessfully view a tempo#show when entered directly' do
    visit tempo_path(tempo.id)

    expect(page).to have_content(tempo.name)
    expect(page).to have_content(tempo.description)
  end

  scenario 'sucessfully view a tempo#show from tempos#index_path or
  dance_path' do
    visit tempos_path
    click_on tempo.name

    expect(page).to have_current_path(tempo_path(tempo.id))

    visit dance_path(dance)
    click_on tempo.name

    expect(page).to have_current_path(tempo_path(tempo.id))

    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
