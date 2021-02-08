module NasaAPI
  def self.base_url
    'https://api.nasa.gov'
  end

  def self.api_key
    ENV.fetch('NASA_API_KEY')
  end
end
