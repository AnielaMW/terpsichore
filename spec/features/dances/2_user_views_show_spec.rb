require 'rails_helper'

feature 'view dances#show', %{
  As a Guest
  I want to view the dances#show
  So I can get all information about a dance.
  } do
  # Acceptance
  # When a guest visits a dance#show_path,
  # they should expect to see all details of a dance
  # When a guest clicks on a link from the #root_path,
  # they should expect to see all details of a dance
  # When a guest clicks on a link from the dances#index_path,
  # they should expect to see all details of a dance
  # Details must include Creator(User),
  #   Title, Formation, Meter
  # Details may include Choreographer, Year, Publication

  let!(:dance1) { FactoryBot.create(:dance) }
  let!(:dance2) { FactoryBot.create(:choreographed) }

  scenario 'sucessfully view a dance#show when entered directly' do
    visit dance_path(dance1.id)

    expect(page).to have_content(dance1.title)
    expect(page).to have_content(dance1.user.user_name)
    expect(page).to have_content(dance1.formation.name)
    expect(page).to have_content(dance1.meter.name)
    expect(page).not_to have_content("Choreographer")
    expect(page).not_to have_content("Publication")

    visit dance_path(dance2.id)

    expect(page).to have_content(dance2.title)
    expect(page).to have_content(dance2.choreographer)
    expect(page).to have_content(dance2.publication)
    expect(page).to have_content(dance2.year)
  end

  scenario 'sucessfully view a dance#show from dances#index_path and
  root_path' do
    visit dances_path
    click_on dance1.title.to_s

    expect(page).to have_current_path(dance_path(dance1.id))

    visit root_path
    click_on dance1.title.to_s

    expect(page).to have_current_path(dance_path(dance1.id))

    # MAYBE IT SHOULD OPEN IN A NEW TAB SO THE USER DOENS'T LOSE THEIR SPOT
    # IN THE INDEX LIST
  end
end
