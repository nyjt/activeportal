require 'spec_helper'

feature 'I18n.locale' do
  after(:all) do
    I18n.available_locales = [:en]
    I18n.default_locale = :en
    I18n.locale = :en
  end

  scenario 'should set from locale param of requested URL' do
    I18n.available_locales = [:hu, :en, :de]
    I18n.default_locale = :en
    visit '/?locale=de'
    expect(I18n.locale).to eq(:de)
  end

  feature 'using Accept-Language HTTP header' do
    scenario 'should set :nl according to available_locales (en, hu, fr, nl)' do
      I18n.available_locales = %w(en hu fr nl)
      I18n.default_locale = :fr
      Capybara.current_session.driver.header('Accept-Language', 'nl-NL,nl;q=0.8,en;q=0.6')
      visit '/'
      expect(I18n.locale).to eq(:nl)
    end

    scenario 'should set :fr according to available_locales (de, fr)' do
      I18n.available_locales = %w(de fr)
      I18n.default_locale = :de
      Capybara.current_session.driver.header('Accept-Language', 'en-US,en;q=0.8,fr;q=0.6')
      visit '/'
      expect(I18n.locale).to eq(:fr)
    end
  end

  scenario 'should set to default value' do
    I18n.available_locales = [:en, :hu, :fr]
    I18n.default_locale = :fr
    visit '/'
    expect(I18n.locale).to eq(:fr)
  end
end
