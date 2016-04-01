class QueryPerformer
  attr_reader :data

  def initialize(filename = nil)
    @data = List.new(filename).data
  end

  def order_by_last_name
    data.sort { |record_a, record_b| record_b[:last] <=> record_a[:last] }
  end

  def order_by_gender
    data.sort_by { |record| [record[:gender], record[:last]] }
  end

  def order_by_dob
    data.sort_by { |record| Date.parse(formatted_dob(record[:birthdate])) }
  end

  private

  def formatted_dob(raw_dob)
    raw_dob.sub(/(\d+)[-\/](\d+)[-\/](\d+)/, '\2-\1-\3')
  end
end
