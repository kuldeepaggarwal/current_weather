module Weather
  mattr_accessor :adapter
  self.adapter = :open_weather

  module_function

  def by_geo_coordinates(latitude:, longitude:, params: {})
    "#{adapter.to_s.classify}API".constantize.fetch_weather_by_coordinates(latitude, longitude, params)
  end
end
