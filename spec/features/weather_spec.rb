require 'rails_helper'

feature 'Display of Weather' do
  scenario 'with random weather' do
    VCR.use_cassette('random_weather') do
      visit root_path
      allow_any_instance_of(Object).to receive(:rand).and_return(52.5200, 13.4050)
      click_on 'Show Random Weather'

      expect(page).to have_content('Current weather for Berlin Mitte is: 17(metric)')
    end
  end
end
