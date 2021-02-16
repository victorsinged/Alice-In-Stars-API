class AsteroidsController < ApplicationController
  def search
    start_date_or_today ||= params[:start_date] || Date.today
    end_date_or_today ||= params[:end_date] || Date.today
    
    result = nasa_api_service.catch_neows_by_date_range(
                   start_date: start_date_or_today,
                   end_date: end_date_or_today
            )
    
    render json: result
  end
  
  private
  
  def nasa_api_service
    NasaApiService.new(
      nasa_api: NasaApi.new(
        http_client: HttpClient.new(
          http_client_handler: RestClient
        )
      )
    )
  end
end
