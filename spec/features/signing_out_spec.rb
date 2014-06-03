require 'spec_helper'

feature 'Signing out' do
  given(:default_params) { { locale: :en } }
  given(:user_args) { FactoryGirl.attributes_for(:user) }
  given(:user) { ActivePortal::User.create!(user_args) }

  scenario 'Signing in and signing out' do
    visit active_portal.user_session_path(default_params)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user_args[:password]
    click_button 'Sign in'

    expect(page).to have_text('Logout')
    click_link('Logout')
    expect(page).to have_text('Signed out successfully.')
  end
end
