require 'rails_helper'

feature 'views users list', %{
  As a user
  I want to view accounts
  So that I can see public profiles of users
  } do

  # ACCEPTANCE CRITERIA
  # * User must e signed in to view members list
  # * Clicking on a members list to the user#index.
  # * User can view the first_name of all users alphabetically
  # * User cannot view the last_name, password, email of users
  # * click a link to thier user profile

  let!(:anne) { FactoryGirl.create(:anne) }
  let!(:will) { FactoryGirl.create(:anne, user_name: 'Will') }
  let!(:fred) { FactoryGirl.create(:anne, user_name: 'Fred') }

  scenario 'sucessfully view member list with authenticated user' do
    sign_in anne
    visit users_path

    names = page.all(".info-list article")

    expect(names[0]).to have_content(fred.user_name)
    expect(names[1]).to have_content(anne.user_name)
    expect(page).not_to have_content(anne.last_name)
    expect(page).not_to have_content(anne.email)
    expect(page).not_to have_content(anne.password)
    expect(names[2]).to have_content(will.user_name)
  end

  scenario 'fail to view member list with unauthenticated user' do
    visit users_path

    expect(page).to have_content("sign in or sign up before continuing.")
  end
end
