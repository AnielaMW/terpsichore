require 'rails_helper'

feature 'view meters#show', %{
  As a Guest
  I want to view the meters#show
  So I can get all information about a meter.
  } do
  # Acceptance
  # When a guest visits a meter#show_path,
  # they should expect to see all details of a meter
  # When a guest clicks on a link from the meters#index_path,
  # they should expect to see all details of a meter
  # Details must include Name and Description

  let!(:meter) { FactoryBot.create(:meter) }
  let!(:dance) { FactoryBot.create(:dance, meter_id: meter.id) }

  scenario 'sucessfully view a meter#show when entered directly' do
    visit meter_path(meter.id)

    expect(page).to have_content(meter.name)
  end

  scenario 'sucessfully view a meter#show from meters#index_path or
  dance_path' do
    visit meters_path
    click_on meter.name.to_s

    expect(page).to have_current_path(meter_path(meter.id))

    visit dance_path(dance)
    click_on meter.name.to_s

    expect(page).to have_current_path(meter_path(meter.id))
    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
