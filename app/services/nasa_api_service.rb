class NasaApiService
  def initialize(nasa_api_handler)
    @nasa_api_handler = nasa_api_handler
  end

  def catch_neows_by_date_range(start_date:, end_date:)
    start_date_or_today = start_date ||= Date.today
    end_date_or_today = end_date ||= Date.today
    nasa_api_handler_class = @nasa_api_handler.fetch(:nasa_api_handler)

    nasa_api_handler_class.catch_neows(
      start_date: start_date_or_today,
      end_date: end_date_or_today
    )
  end

  private

  attr_reader :nasa_api_handler
end
