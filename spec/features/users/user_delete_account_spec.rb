require 'rails_helper'

feature 'deletes account', %{
  As an authenticated user
  I want to delete my account
  So that my profile is no longer retained
  } do

  # ACCEPTANCE CRITERIA
  # * User can delete account

  let!(:anne) { FactoryBot.create(:anne) }

  scenario 'sucessfully delete account' do
    sign_in anne
    visit user_path(anne)
    click_on 'Edit Account'
    click_on 'Cancel My Account'

    expect(page).to have_content(
      'Your account has been successfully cancelled.'
    )
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Sign In')
  end
end
