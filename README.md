# CurrentWeather

It is a simple application to show weather for random or a specified location.

### Requirements:

- Ruby 2.4.0
- Bundler gem(`gem install bundler`)
- Set `WEATHER_API_ACCESS_ID` environment variable with the Access-ID of OpenWeatherMap


1. clone the project
2. run `bundle install`

### Run the project

1. Run the server by the following command:
    `WEATHER_API_ACCESS_ID=<api_key> bundle exec rails s`
2. Visit `localhost:3000` in the browser and play with the solution.

### Test

1. Setup Selenium to run the specs, please refer [Selenium](https://github.com/seleniumhq/selenium) docs.
2. run `bundle exec rspec spec`
