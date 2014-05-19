require 'spec_helper'

feature 'Signing in' do
  given(:default_params) { { locale: :en } }
  given(:other_user) { FactoryGirl.attributes_for(:user) }
  background do
    ActivePortal::User.create!(email: 'user@example.com', password: 'hello123', password_confirmation: 'hello123')
  end

  scenario 'Signing in with correct credentials' do
    visit active_portal.user_session_path(default_params)

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'hello123'
    click_button 'Sign in'

    expect(page).to have_text 'success'
    expect(page).not_to have_text('translation missing')
  end

  scenario 'Signing in as another user' do
    visit active_portal.user_session_path(default_params)

    fill_in 'Email', with: other_user[:email]
    fill_in 'Password', with: other_user[:password]
    click_button 'Sign in'

    expect(page).to have_text 'Invalid email or password'
    expect(page).not_to have_text 'Logout'
  end

  scenario 'Signing in twice handle with error message' do
    visit active_portal.user_session_path(default_params)

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'hello123'
    click_button 'Sign in'

    visit active_portal.user_session_path(default_params)

    expect(page).to have_text('You are already signed in.')
  end
end
