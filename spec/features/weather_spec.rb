require 'rails_helper'

feature 'Display of Weather' do
  scenario 'without api key' do
    visit root_path

    fill_in :city, with: 'Berlin'
    fill_in :country_code, with: 'DE'
    allow(Rails.application.secrets).to receive(:weather_api_access_id).and_return(nil)
    expect { click_on 'Show Weather'}.to raise_error(OpenWeatherAPI::Error, 'Please set WEATHER_API_ACCESS_ID env variable')
  end

  scenario 'with random weather' do
    VCR.use_cassette('random_weather') do
      visit root_path
      allow_any_instance_of(Object).to receive(:rand).and_return(52.5200, 13.4050)
      click_on 'Show Random Weather'

      expect(page).to have_content('Current weather for Berlin Mitte is: 17(metric)')
    end
  end

  scenario 'with specified location' do
    VCR.use_cassette('city_country_weather') do
      visit root_path

      fill_in :city, with: 'Berlin'
      fill_in :country_code, with: 'DE'
      click_on 'Show Weather'

      expect(page).to have_content('Current weather for Berlin is: 17(metric)')
    end
  end

  scenario 'with empty specified location' do
    VCR.use_cassette('empty_location_weather') do
      visit root_path

      click_on 'Show Weather'

      expect(page).to have_content('Unfortunately we could not find the location')
    end
  end

  scenario 'with invalid specified location' do
    VCR.use_cassette('invalid_location_weather') do
      visit root_path

      fill_in :city, with: 'dasdhaskduhasukjdas dughasdbkn'
      click_on 'Show Weather'

      expect(page).to have_content('Unfortunately we could not find the location')
    end
  end
end
