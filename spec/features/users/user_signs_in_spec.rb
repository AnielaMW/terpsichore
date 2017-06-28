require 'rails_helper'

feature 'sign_in to account', %{
  As a user
  I want to sign in to my account
  So that I can be signed-in
  } do

  # ACCEPTANCE CRITERIA
  # * User provide email
  # * User provide password
  # * If information is incomplete, User gets error message.
  # * If information is invalid, User gets error message.

  let!(:anne) { FactoryGirl.create(:anne) }
  william = { email: 'two_faced@bath.com', password: 'lied4money' }

  scenario 'sucessfully sign_in when user enters valid information' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: anne.email.to_s
    fill_in 'Password', with: anne.password.to_s
    click_on 'Log In'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).not_to have_content('Sign In')
  end

  scenario 'fails to sign_in when user enters incomplete information' do
    visit root_path
    click_on 'Sign In'
    click_on 'Log In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end

  scenario 'fails to sign_in when user enters invalid email' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: william[:email].to_s
    fill_in 'Password', with: anne.password.to_s
    click_on 'Log In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end

  scenario 'fails to sign_in when user enters invalid password' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: anne.email.to_s
    fill_in 'Password', with: william[:password].to_s
    click_on 'Log In'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign In')
  end
end
