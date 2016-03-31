class List
  DEFAULT_FILE_LOCATION = './app/records.txt'
  attr_reader :data

  def initialize(location = DEFAULT_FILE_LOCATION)
    @location = location
    @data = []
    read_file
  end

  def self.write(data, location = DEFAULT_FILE_LOCATION)
    File.open(location,'a') do |f|
      f.puts(data)
      data
    end
  end

  def order_by_last_name
    @data.sort { |record_a, record_b | record_b[:last] <=> record_a[:last] }
  end

  def order_by_gender
    @data.sort_by { |record | [record[:gender], record[:last]] }
  end

  def order_by_dob
    @data.sort_by { |record | Date.parse(formatted_dob(record[:birthdate])) }
  end

  private

  def read_file
    File.open(@location,'r') do |file|
      format_data(file)
    end
  end

  def format_data(file)  
    file.each_line { |line| @data << format_line(line) }
  end

  def format_line(line)
    ary = line.rstrip.split(/,\s?/)
    { last: ary[0], first: ary[1], gender: ary[2], color: ary[3], birthdate: ary[4] }
  end

  def formatted_dob(raw_dob)
    raw_dob.sub(/(\d+)[-\/](\d+)[-\/](\d+)/, '\2-\1-\3')
  end
end