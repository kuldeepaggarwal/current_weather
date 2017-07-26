module OpenWeatherAPI
  module_function

  def fetch_weather_by_coordinates(latitude, longitude, params = {})
    request_params = { lat: latitude, lon: longitude }.reverse_merge(params)
    build_response(request_params)
  end

  def fetch_weather_by_location(city, country_code = nil, params = {})
    request_params = { q: [city, country_code].join(',') }.reverse_merge(params)
    build_response(request_params)
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

    def build_response(request_params)
      assert_access_id!
      params = request_params.reverse_merge(appid: Rails.application.secrets.weather_api_access_id)
      uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?#{params.to_param}")
      Response.new(JSON(Net::HTTP.get(uri)), params).tap do |response|
        check_for_api_key!(response)
      end
    end

    def check_for_api_key!(response)
      if response.invalid? && response.error_message.match('Invalid API key')
        raise Error, 'Please set a valid WEATHER_API_ACCESS_ID env variable'
      end
    end
end
