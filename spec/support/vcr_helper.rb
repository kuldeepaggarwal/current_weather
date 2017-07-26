VCR.configure do |c|
  c.configure_rspec_metadata!
  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.ignore_localhost = true
  c.filter_sensitive_data('<WEATHER_API_ACCESS_ID>') { ENV['WEATHER_API_ACCESS_ID'] }
end
