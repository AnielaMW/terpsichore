require 'rails_helper'

feature 'view meters#index', %{
  As a Guest
  I want to view the meters#index
  So I can pick from all meters.
  } do
  # Acceptance
  # When a guest visits the meters#index_path,
  # they should expect to see a list of all meters
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:meter1) { FactoryBot.create(:meter, name: "5/8") }
  let!(:meter2) { FactoryBot.create(:meter, name: "3/4") }
  let!(:meter3) { FactoryBot.create(:meter, name: "8/16") }

  scenario 'sucessfully view the meters#index' do
    visit meters_path

    meters = page.all(".info-list article")

    expect(meters[0]).to have_content(meter2.name)
    expect(meters[1]).to have_content(meter1.name)
    expect(meters[2]).to have_content(meter3.name)
  end
end
