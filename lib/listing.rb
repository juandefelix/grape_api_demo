class Listing
  DEFAULT_FILE_LOCATION = 'records.txt'
  attr_reader :data


  def initialize(location = DEFAULT_FILE_LOCATION)
    @location = location
    @data = []
    read_file
  end

  def self.write(data, location = DEFAULT_FILE_LOCATION)
    File.open(location,'a') { |f| f.puts(data) }
  end

  def order_by_last_name
    @data.sort { |record_a, record_b | record_b[0] <=> record_a[0] }
  end

  def order_by_gender
    @data.sort_by { |last, first, gender, color, dob | [gender, last] }
  end

  def order_by_dob
    @data.sort_by { |last, first, gender, color, dob | Date.parse(formatted_dob(dob)) }
  end

  private

  def format_data(file)  
    file.each_line { |line| @data << format_line(line) }
  end

  def read_file
    File.open(@location,'r') do |file|
      format_data(file)
    end
  end

  def format_line(line)
    line.rstrip.split(/,\s?/)
  end

  def formatted_dob(raw_dob)
    raw_dob.sub(/(\d+)[-\/](\d+)[-\/](\d+)/, '\2-\1-\3')
  end
end