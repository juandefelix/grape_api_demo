require 'spec_helper'

describe ListingApp::API do
  include Rack::Test::Methods

  def app
    ListingApp::API
  end

  context 'GET /v1/records/gender' do
    it 'returns an array of with the right order' do
      sorted_data = [{ last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                     { last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' },
                     { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' },
                     { last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' }]
      sorted_data = sorted_data.map { |hash| hash.stringify_keys }
      get '/v1/records/gender'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq sorted_data
    end
  end

  context 'GET /v1/records/birthdate' do
    it 'returns an array of with the right order' do
      sorted_data = [{ last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' },
                     { last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' },
                     { last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                     { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' }]
                     sorted_data = sorted_data.map { |hash| hash.stringify_keys }
      get '/v1/records/birthdate'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq sorted_data
    end
  end
end