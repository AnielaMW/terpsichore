require 'rails_helper'

feature 'view formations#index', %{
  As a Guest
  I want to view the formations#index
  So I can pick from all formations.
  } do
  # Acceptance
  # When a guest visits the formations#index_path,
  # they should expect to see a list of all formations
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:form1) { FactoryBot.create(:formation, name: "2 Couple") }
  let!(:form2) { FactoryBot.create(:formation, name: "Scicilian Circle") }
  let!(:form3) { FactoryBot.create(:formation, name: "4 Couple") }

  scenario 'sucessfully view the formations#index' do
    visit formations_path

    formations = page.all(".info-list article")

    expect(formations[0]).to have_content(form1.name)
    expect(formations[1]).to have_content(form3.name)
    expect(formations[2]).to have_content(form2.name)
  end
end
