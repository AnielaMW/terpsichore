require 'rails_helper'

feature 'create account', %{
  As a User
  I want to create an account
  So that I can login
  } do
  # Acceptance
  # * User must specify first_name, last_name, email.
  # * User must specify a unique user_name.
  # * User must specify and confirm password.
  # * If all information is complete, User is registered and authenticated.
  # * If information is incomplete, User gets error message.

  # let!(:anne) { FactoryGirl.create(:anne) }
  william = { first_name: 'William',
              last_name: 'Elliot',
              user_name: 'SirWilliam',
              alt_user_name: 'SirElliot',
              email: 'heirtowalter@kellage.com',
              password: 'readytoinherit' }

  scenario 'sucessfully create account when user enters valid information' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: william[:first_name].to_s
    fill_in 'Last Name', with: william[:last_name].to_s
    fill_in 'Username', with: william[:user_name].to_s
    fill_in 'Email', with: william[:email].to_s
    fill_in 'Password', with: william[:password].to_s
    fill_in 'Confirm Password', with: william[:password].to_s
    click_on 'Create Account'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'fails to create account when user enters invalid information' do
    visit root_path
    click_on 'Sign Up'
    click_on 'Create Account'

    expect(page).to have_content('
    errors prohibited this user from being saved:')
    expect(page).to have_content('Sign Up')
  end

  scenario 'fails to create account when user enters an existing username' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: william[:first_name].to_s
    fill_in 'Last Name', with: william[:last_name].to_s
    fill_in 'Username', with: william[:user_name].to_s
    fill_in 'Email', with: william[:email].to_s
    fill_in 'Password', with: william[:password].to_s
    fill_in 'Confirm Password', with: 'playingbothsides'
    click_on 'Create Account'

    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to have_content('Sign Up')
  end

  scenario 'fails to create account when user password and
  confirm password do not match' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'First Name', with: william[:first_name].to_s
    fill_in 'Last Name', with: william[:last_name].to_s
    fill_in 'Username', with: william[:alt_user_name].to_s
    fill_in 'Email', with: william[:email].to_s
    fill_in 'Password', with: william[:password].to_s
    fill_in 'Confirm Password', with: 'playingbothsides'
    click_on 'Create Account'

    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to have_content('Sign Up')
  end
end
