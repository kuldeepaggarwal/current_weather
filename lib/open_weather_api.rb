module OpenWeatherAPI
  module_function

  def fetch_weather_by_coordinates(latitude, longitude, params = {})
    assert_access_id!
    request_params = {
      lat: latitude,
      lon: longitude,
      appid: Rails.application.secrets.weather_api_access_id
    }.reverse_merge(params)
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?#{request_params.to_param}")
    Response.new(JSON(Net::HTTP.get(uri)), request_params)
  end

  def fetch_weather_by_location(city, country_code = nil, params = {})
    assert_access_id!
    request_params = {
      q: [city, country_code].join(','),
      appid: Rails.application.secrets.weather_api_access_id
    }.reverse_merge(params)
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?#{request_params.to_param}")
    Response.new(JSON(Net::HTTP.get(uri)), request_params)
  end

  private

    module_function

    def assert_access_id!
      unless access_id
        raise Error, 'Please set WEATHER_API_ACCESS_ID env variable'
      end
    end

    def access_id
      Rails.application.secrets.weather_api_access_id
    end
end
