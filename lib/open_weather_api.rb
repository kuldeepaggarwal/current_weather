module OpenWeatherAPI
  module_function

  def fetch_weather_by_coordinates(latitude, longitude, params = {})
    request_params = {
      lat: latitude,
      lon: longitude,
      appid: Rails.application.secrets.weather_api_access_id
    }.reverse_merge(params)
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?#{request_params.to_param}")
    Response.new(JSON(Net::HTTP.get(uri)), request_params)
  end
end
