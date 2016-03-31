require 'spec_helper'

RSpec.describe Listing do
  describe '::write' do
    it 'receives a string as parameter' do 
      expect(Listing).to receive(:write).with(instance_of(String))
      Listing.write('Ortiz | Díaz | Male | Blue | 07-26-1976')
    end

    it 'writes to file' do
      expect(File).to receive(:open).with('records.txt', 'a')
      Listing.write('Ortiz | Díaz | Male | Blue | 07-26-1976')
    end
  end

  describe '::new' do
    it 'returns a Instance fo Listing' do 
      expect(Listing.new('./spec/support/records.txt')).to be_an_instance_of(Listing)
    end
  end

  describe '#data'  do
    it 'returns an array with the righ format' do
      data_copy = [['corey', 'juan', 'male', 'red', '07-26-1976'],
                   ['abbott', 'glenn', 'male', 'blue', '06-22-1999'],
                   ['murphy', 'janet', 'female', 'green', '03-13-1999'],
                   ['ortiz', 'eve', 'female', 'red', '05-07-1969']]

      listing_instance = Listing.new('./spec/support/records.txt')
      expect(listing_instance.data).to eq data_copy
    end
  end

  describe 'ordering_methods' do
    before(:each) do
      @listing = Listing.new('./spec/support/records.txt')
    end

    it 'order_by_last_name' do
      sorted_data = [['ortiz', 'eve', 'female', 'red', '05-07-1969'],
                     ['murphy', 'janet', 'female', 'green', '03-13-1999'],
                     ['corey', 'juan', 'male', 'red', '07-26-1976'],
                     ['abbott', 'glenn', 'male', 'blue', '06-22-1999']]

      expect(@listing.order_by_last_name).to eq sorted_data
    end

    it 'order_by_gender' do
      sorted_data = [['murphy', 'janet', 'female', 'green', '03-13-1999'],
                     ['ortiz', 'eve', 'female', 'red', '05-07-1969'],
                     ['abbott', 'glenn', 'male', 'blue', '06-22-1999'],
                     ['corey', 'juan', 'male', 'red', '07-26-1976']]

      expect(@listing.order_by_gender).to eq sorted_data
    end

    it 'order_by_dob' do
      sorted_data = [['ortiz', 'eve', 'female', 'red', '05-07-1969'],
                     ['corey', 'juan', 'male', 'red', '07-26-1976'],
                     ['murphy', 'janet', 'female', 'green', '03-13-1999'],
                     ['abbott', 'glenn', 'male', 'blue', '06-22-1999']]

      expect(@listing.order_by_dob).to eq sorted_data
    end
  end
end