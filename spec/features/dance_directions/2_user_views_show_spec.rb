require 'rails_helper'

feature 'view dance_directions#show', %{
  As a Guest
  I want to view the dance_directions#show
  So I can get all information about a single direction.
  } do
  # Acceptance
  # When a guest visits a dance_directions#show_path,
  # they should expect to see all details of a dance_direction
  # When a guest clicks on a link from the dance_path,
  # they should expect to see all details of a dance_direction
  # Details must include Dance.title, sequence, direction
  # Details may include mark, measure, position, comments

  let!(:dir1) { FactoryBot.create(:dd) }
  let!(:dir2) { FactoryBot.create(:dod) }

  scenario 'sucessfully view a dance_direction#show when entered directly' do
    visit dance_dance_direction_path(dir1.dance_id, dir1.id)

    expect(page).to have_content(dir1.movement)
    expect(page).to have_content(dir1.dance.title)
    expect(page).to have_content(dir1.sequence)
  end

  scenario 'sucessfully view dance_direction#show with optional information' do
    visit dance_dance_direction_path(dir2.dance_id, dir2.id)

    expect(page).to have_content(dir2.movement)
    expect(page).to have_content(dir2.dance.title)
    expect(page).to have_content(dir2.sequence)
    expect(page).to have_content(dir2.mark)
    expect(page).to have_content(dir2.measure)
    expect(page).to have_content(dir2.position)
  end

  scenario 'sucessfully view a dance_directions#show from dance_path' do
    visit dance_path(dir1.dance_id)
    # May eventutally want to be able to click anywhere within this sequences
    # table row to access this page.
    click_on dir1.sequence.to_s

    expect(page).to have_current_path(
      dance_dance_direction_path(dir1.dance_id, dir1.id)
    )
  end
end
