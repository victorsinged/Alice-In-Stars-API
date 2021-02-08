class AsteroidsController < ApplicationController
  require 'nasa_api'

  NEOWS_URL = "#{NasaAPI.base_url}/neo/rest/v1/feed"

  def search
    start_date = params[:start_date] ||= Date.today
    end_date = params[:end_date] ||= Date.today
    api_key = NasaAPI.api_key

    result = RestClient.get(
      "#{NEOWS_URL}?start_date=#{start_date}\
      &end_date=#{end_date}&api_key=#{api_key}"
    )

    render json: result
  end
end
