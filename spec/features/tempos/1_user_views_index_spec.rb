require 'rails_helper'

feature 'view tempos#index', %{
  As a Guest
  I want to view the tempos#index
  So I can pick from all tempos.
  } do
  # Acceptance
  # When a guest visits the tempos#index_path,
  # they should expect to see a list of all tempos
  # The list should be sorted alphabetically by Name
  # The list should include the Name

  let!(:tempo1) { FactoryGirl.create(:tempo, name: "Moderate") }
  let!(:tempo2) { FactoryGirl.create(:tempo, name: "Fast") }
  let!(:tempo3) { FactoryGirl.create(:tempo, name: "Slow") }

  scenario 'sucessfully view the tempos#index' do
    visit tempos_path

    tempos = page.all(".info-list article")

    expect(tempos[0]).to have_content(tempo1.name)
    expect(tempos[1]).to have_content(tempo2.name)
    expect(tempos[2]).to have_content(tempo3.name)
  end
end
