require 'rails_helper'

feature 'sign_out of account', %{
  As an authenticated user
  I want to sign out of my account
  So I am no longer logged into the site
  } do

  # ACCEPTANCE CRITERIA
  # * User signs out

  let!(:anne) { FactoryGirl.create(:anne) }

  scenario 'sucessfully sign_out when user signs_out' do
    sign_in anne
    visit root_path
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Sign In')
  end
end
