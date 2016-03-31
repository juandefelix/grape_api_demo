require 'spec_helper'

RSpec.describe StringParser do
  describe '#serialize_input' do
    before(:each) do
      @parser = StringParser.new('Ortiz | Juan | Male | Blue | 07-26-1976')
    end

    it 'it is an public instance method' do 
      expect(@parser).to receive(:serialize_input)
      @parser.serialize_input
    end

    it 'returns a hash with parsed values' do
      expected_results  = 'Ortiz,Juan,Male,Blue,07-26-1976'
      expect(@parser.serialize_input).to eq expected_results 
    end

    it 'accepts more than one format' do
      parser = StringParser.new('Ortiz, Juan, Male, Blue, 07-26-1976')
      expected_results  = 'Ortiz,Juan,Male,Blue,07-26-1976'
      expect(@parser.serialize_input).to eq expected_results 
    end

    it 'user_input is nil when format is not correct' do
      wrong_format_string = 'Ortiz || Juan | Male | Blue | 07-26-1976'
      expect(StringParser.new(wrong_format_string).serialize_input).to eq nil
    end
  end
end