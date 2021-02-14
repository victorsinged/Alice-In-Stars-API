class AsteroidsController < ApplicationController

  def search
    result = nasa_api_service.catch_neows_by_date_range(
      start_date: params[:start_date],
      end_date: params[:end_date]
    )

    render json: result
  end

  private

  def nasa_api_service
    NasaApiService.new(
      nasa_api_handler: NasaApiHandler.new(
        http_client: HttpClient.new(
          http_client_handler: RestClient
        )
      )
    )
  end
end
