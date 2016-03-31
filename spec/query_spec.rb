require 'spec_helper'

RSpec.describe QueryPerformer do  
  describe 'ordering_methods' do
    before(:each) do
      @performer = QueryPerformer.new('./spec/support/records.txt')
    end

    it 'order_by_last_name' do
      sorted_data = [{ last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' },
                     { last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                     { last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' },
                     { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' }]

      expect(@performer.order_by_last_name).to eq sorted_data
    end

    it 'order_by_gender' do
      sorted_data = [{ last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                     { last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' },
                     { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' },
                     { last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' }]

      expect(@performer.order_by_gender).to eq sorted_data
    end

    it 'order_by_dob' do
      sorted_data = [{ last: 'ortiz', first: 'eve', gender: 'female', color: 'red', birthdate: '05-07-1969' },
                     { last: 'corey', first: 'juan', gender: 'male', color: 'red', birthdate: '07-26-1976' },
                     { last: 'murphy', first: 'janet', gender: 'female', color: 'green', birthdate: '03-13-1999' },
                     { last: 'abbott', first: 'glenn', gender: 'male', color: 'blue', birthdate: '06-22-1999' }]

      expect(@performer.order_by_dob).to eq sorted_data
    end
  end
end