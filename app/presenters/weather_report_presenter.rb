class WeatherReportPresenter
  def initialize(weather_respose)
    @weather_respose = weather_respose
  end

  def display
    "Current weather for #{weather_respose.location_name}" \
    " is: #{weather_respose.temperature}(#{weather_respose.temperature_unit})"
  end

  private

    attr_reader :weather_respose
end
