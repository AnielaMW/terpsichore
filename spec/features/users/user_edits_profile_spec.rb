require 'rails_helper'

feature 'edits account', %{
  As an authenticated user
  I want to edit my account
  So that I can update my profile
  } do

  # ACCEPTANCE CRITERIA
  # * User can edit first_name
  # * User can edit last_name
  # * User can edit email
  # * If all information is complete, User is updated.
  # * If information is incomplete, User gets error message.

  let!(:anne) { FactoryBot.create(:anne) }

  scenario 'sucessfully update account when user enters valid information' do
    mrs_anne = { first_name: 'Mrs. Anne',
                 last_name: 'Wentworth',
                 email: 'love@lyme.uk' }

    sign_in anne
    visit user_path(anne)
    click_on 'Edit Account'
    fill_in 'First Name', with: anne[:first_name].to_s
    fill_in 'Last Name', with: anne[:last_name].to_s
    fill_in 'Email', with: anne[:email].to_s
    fill_in 'Current password', with: anne.password.to_s
    click_on 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'fails to update account when user enters invalid information' do

    sign_in anne
    visit user_path(anne)
    click_on 'Edit Account'
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: ''
    click_on 'Update'

    expect(page).to have_content('prohibited this user from being saved:')
  end
end
