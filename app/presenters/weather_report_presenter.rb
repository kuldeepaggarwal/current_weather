class WeatherReportPresenter
  def initialize(weather_respose)
    @weather_respose = weather_respose
  end

  def display
    if weather_respose.valid?
      "Current weather for #{weather_respose.location_name}" \
      " is: #{weather_respose.temperature}(#{weather_respose.temperature_unit})"
    else
      'Unfortunately we could not find the location'
    end
  end

  private

    attr_reader :weather_respose
end
