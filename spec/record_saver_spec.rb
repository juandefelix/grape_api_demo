require 'spec_helper'

RSpec.describe RecordSaver do 
  describe '#save' do
    after(:each) do
      doc = <<-STR
corey, juan, male,red, 07-26-1976
abbott, glenn, male,blue, 06-22-1999
murphy, janet, female,green, 03-13-1999
ortiz, eve, female,red, 05-07-1969
      STR
      File.open('./spec/support/records.txt', 'w') { |f| f.write(doc)}
    end
    
    it 'return status ok with forperly formatted string' do
      file = double()
      saver = RecordSaver.new('Byrne, Joan, Female, Green, 3-12-1987')
      expect(saver.save).to eq({ status: 'ok' })
    end

    it 'return status ok with forperly formatted string' do
      saver = RecordSaver.new('Byrne, ||Joan, Female, Green, 3-12-1987')
      expect(saver.save).to eq({ status: 'failed' })
    end
  end
end