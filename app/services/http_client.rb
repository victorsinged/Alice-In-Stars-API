class HttpClient
  def initialize(http_client_handler)
    @http_client_handler = http_client_handler
  end

  def get_neows(uri:, start_date:, end_date:, api_key:)
    http_client_handler_class = @http_client_handler.fetch(:http_client_handler)
    http_client_handler_class.get(
      "#{uri}?start_date=#{start_date}\
       &end_date=#{end_date}&api_key=#{api_key}"
    )
  end

  private

  attr_reader :http_client_handler
end
