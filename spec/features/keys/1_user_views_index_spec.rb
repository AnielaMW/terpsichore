require 'rails_helper'

feature 'view keys#index', %{
  As a Guest
  I want to view the keys#index
  So I can pick from all keys.
  } do
  # Acceptance
  # When a guest visits the keys#index_path,
  # they should expect to see a list of all keys
  # The list should be sorted alphabetically by Title
  # The list should include the Name

  let!(:level1) { FactoryGirl.create(:key, name: "Db") }
  let!(:level2) { FactoryGirl.create(:key, name: "A") }
  let!(:level3) { FactoryGirl.create(:key, name: "G") }

  scenario 'sucessfully view the keys#index' do
    visit keys_path

    keys = page.all(".info-list article")

    expect(keys[0]).to have_content(level2.name)
    expect(keys[1]).to have_content(level1.name)
    expect(keys[2]).to have_content(level3.name)

    visit root_path
    click_on "Keys"

    keys = page.all(".info-list article")

    expect(keys[0]).to have_content(level2.name)
    expect(keys[1]).to have_content(level1.name)
    expect(keys[2]).to have_content(level3.name)
  end
end
