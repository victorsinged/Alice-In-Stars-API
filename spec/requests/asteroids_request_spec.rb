require 'rails_helper'

RSpec.describe "Asteroids", type: :request do
  context 'when no parameters are informed', :vcr do
    it 'find asteroid info from today' do
      get '/asteroids'

      neows_date = response.parsed_body['near_earth_objects']['2021-02-14']
      expect(neows_date).to be_present
      expect(neows_date.class).to eq(Array)
    end
  end

  context 'when parameters are informed', :vcr do
    let(:params) do
      {
        start_date: '2021-01-05',
        end_date: '2021-01-06'
      }
    end

    it 'find asteroid info from date range' do
      get '/asteroids', params: params

      range1 = response.parsed_body['near_earth_objects'][params[:start_date]]
      range2 = response.parsed_body['near_earth_objects'][params[:end_date]]
      expect(range1).to be_present
      expect(range2).to be_present
      expect(range1.class).to eq(Array)
      expect(range2.class).to eq(Array)
    end
  end

  context 'without api key' do
    before do
      allow(ENV).to receive(:fetch).with('NASA_API_KEY').and_return('')
    end
    it 'raises error' do
      get '/asteroids'

      expect(response.code).to eq('500')
      expect(response.error?).to be_truthy
    end
  end
end
