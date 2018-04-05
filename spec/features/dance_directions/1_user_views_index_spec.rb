require 'rails_helper'

feature 'view dance directions', %{
  As a Guest
  I want to view the dance page and see it's directions
  So I can see all dance_directions for a dance.
  } do
  # Acceptance
  # When a guest visits a dance
  # they should expect to see a list of all dance_directions
  # The list should be sorted by sequence
  # The dance_directions#index should list all directions for a given dance
  # The list should be sorted by sequence
  # The list should include the sequence and direction
  # The list may include the mark, measure, and position if provided

  let!(:dance) { FactoryBot.create(:dance) }
  let!(:dir1) { FactoryBot.create(:dod, dance_id: dance.id) }
  let!(:dir2) { FactoryBot.create(:dance_direction, dance_id: dance.id) }
  let!(:dir3) { FactoryBot.create(:dance_direction, dance_id: dance.id) }
  let!(:dir4) { FactoryBot.create(:dance_direction) }

  scenario 'sucessfully view the dance_directions for a given dance' do
    visit dance_path(dance)

    dir_t = page.all(".direction-row")

    expect(dir_t[0]).to have_content(dir1.sequence)
    expect(dir_t[0]).to have_content(dir1.movement)
    expect(dir_t[1]).to have_content(dir2.sequence)
    expect(dir_t[1]).to have_content(dir2.movement)
    expect(dir_t[2]).to have_content(dir3.sequence)
    expect(dir_t[2]).to have_content(dir3.movement)
    expect(dir_t).not_to have_content(dir4.sequence)
    expect(dir_t).not_to have_content(dir4.movement)
  end

  scenario 'sucessfully view the dance_directions with optional information' do
    visit dance_path(dir4.dance_id)

    dir_t = page.all(".direction-row")

    expect(dir_t[0]).to have_content(dir4.sequence)
    expect(dir_t[0]).to have_content(dir4.movement)
    expect(dir_t[0]).to have_content(dir4.mark)
    expect(dir_t[0]).to have_content(dir4.measure)
    expect(dir_t[0]).to have_content(dir4.position)
  end
end
