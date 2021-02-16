class NasaApiService
    def initialize(nasa_api:)
      @nasa_api = nasa_api
    end
  
    def catch_neows_by_date_range(start_date:, end_date:)
      nasa_api.catch_neows(
        endpoint: '/neo/rest/v1/feed',
        start_date: start_date,
        end_date: end_date
      )
    end
  
    private
    
    attr_reader :nasa_api
  end