class NasaApiHandler
  BASE_URL = ENV.fetch('NASA_API_BASE_URL').freeze
  NASA_API_KEY = ENV.fetch('NASA_API_KEY').freeze
  NEOWS_URL = "#{BASE_URL}/neo/rest/v1/feed".freeze

  def initialize(http_client:)
    @http_client = http_client
  end

  def catch_neows(start_date:, end_date:)
    http_client.get_neows(
      uri: NEOWS_URL,
      api_key: NASA_API_KEY,
      start_date: start_date,
      end_date: end_date
    )
  end

  private

  attr_reader :http_client
end
