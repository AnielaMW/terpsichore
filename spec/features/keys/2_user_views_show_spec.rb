require 'rails_helper'

feature 'view keys#show', %{
  As a Guest
  I want to view the keys#show
  So I can get all information about a key.
  } do
  # Acceptance
  # When a guest visits a key#show_path,
  # they should expect to see all details of a key
  # When a guest clicks on a link from the keys#index_path,
  # they should expect to see all details of a key
  # Details must include Name and Description

  let!(:key) { FactoryGirl.create(:key) }
  let!(:dance) { FactoryGirl.create(:dance, key_id: key.id) }

  scenario 'sucessfully view a key#show when entered directly' do
    visit key_path(key.id)

    expect(page).to have_content(key.name)
  end

  scenario 'sucessfully view a key#show from keys#index_path or
  dance_path' do
    visit keys_path
    click_on key.name

    expect(page).to have_current_path(key_path(key.id))

    visit dance_path(dance)
    click_on key.name

    expect(page).to have_current_path(key_path(key.id))

    # AS A TOOLTIP OVER EACH FORMATIONS NAME IN THE DROP DOWN
  end
end
