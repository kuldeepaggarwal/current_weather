module OpenWeatherAPI
  class Response
    VALID_STATUSES = 200..204

    def initialize(json_data, request_params)
      @data = json_data
      @request_params = request_params.stringify_keys
    end

    def temperature
      data['main']['temp']
    end

    def location_name
      data['name']
    end

    def temperature_unit
      request_params['units']
    end

    def valid?
      VALID_STATUSES.cover? data['cod']
    end

    def invalid?
      !valid?
    end

    def error_message
      data['message']
    end

    private

      attr_reader :data, :request_params
  end
end
