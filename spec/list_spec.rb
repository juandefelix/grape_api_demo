require 'spec_helper'

RSpec.describe List do
  describe '::write' do
    it 'receives a string as parameter' do 
      expect(List).to receive(:write).with(instance_of(String)).and_return('Ortiz,Díaz,Male,Blue,07-26-1976')
      List.write('Ortiz,Díaz,Male,Blue,07-26-1976')
    end

    it 'writes to file' do
      expect(File).to receive(:open).with('./spec/support/records.txt', 'a')
      List.write('Ortiz,Díaz,Male,Blue,07-26-1976')
    end
  end

  describe '::new' do
    it 'returns a Instance fo Listing' do 
      expect(List.new('./spec/support/records.txt')).to be_an_instance_of(List)
    end
  end

  describe '#data'  do
    it 'returns an array with the righ format' do
      data_copy = [{ last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' },
                   { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' },
                   { last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                   { last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' }]

      listing_instance = List.new('./spec/support/records.txt')
      expect(listing_instance.data).to eq data_copy
    end
  end
end
