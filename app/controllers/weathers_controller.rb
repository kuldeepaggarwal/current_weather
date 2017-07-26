class WeathersController < ApplicationController
  def index
  end

  def random
    weather_respose = Weather.by_geo_coordinates(latitude: rand(100.0), longitude: rand(200.0), params: { units: 'metric' })
    @report = WeatherReportPresenter.new(weather_respose)
    render :index
  end
end
