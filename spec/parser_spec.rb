require 'spec_helper'

RSpec.describe StringParser do
  describe '#parse' do
    before(:each) do
      @parser = StringParser.new('Ortiz | Juan | Male | Blue | 07-26-1976')
    end

    it 'receives a string as parameter' do 
      expect(@parser).to receive :parse
      @parser.parse
    end

    it 'returns a hash with parsed values' do
      expected_results  = { last: 'Ortiz', first: 'Juan', gender: 'Male', color: 'Blue', dob: '26-07-1976'}
      expect(@parser.parse).to eq expected_results 
    end
  end
end