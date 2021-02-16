class NasaApi
    BASE_URL = ENV.fetch('NASA_API_BASE_URL').freeze
    NASA_API_KEY = ENV.fetch('NASA_API_KEY').freeze
    
    def initialize(http_client:)
      @http_client = http_client
    end
    
    def catch_neows(endpoint:, start_date:, end_date:)
      neows_url = "#{BASE_URL}#{endpoint}".freeze
      
      http_client.get(
        uri: neows_url,
        api_key: NASA_API_KEY,
        start_date: start_date,
        end_date: end_date
      )  
    end
  
    private
      
    attr_reader :http_client
   
  end