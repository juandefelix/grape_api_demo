require 'spec_helper'

RSpec.describe RecordSaver do  
  describe '#save' do
    it 'return status ok with forperly formatted string' do
      List.stub(:write).and_return(File.new)
      saver = RecordSaver.new('Byrne, Joan, Female, Green, 3-12-1987')
      expect(saver.save).to eq({ status: 'ok' })
    end

    it 'return status ok with forperly formatted string' do
      saver = RecordSaver.new('Byrne, ||Joan, Female, Green, 3-12-1987')
      expect(saver.save).to eq({ status: 'failed' })
    end
  end
end