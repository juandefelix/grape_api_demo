class StringParser
  FORMAT_REGEX =  Regexp.union([
    /\s?(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s([\d\/-]+)\s?/,
    /\s?(\w+),\s?(\w+),\s?(\w+),\s?(\w+),\s?([\d\/-]+)\s?/
  ])

  attr_reader :raw_input

  def initialize(raw_input)
    @raw_input = raw_input
  end

  def parse
    { last: $1, first: $2, gender: $3, color: $4, dob: format_dob($5) } if raw_input =~ FORMAT_REGEX
  end

  private

  def format_dob(raw_dob)
    raw_dob.sub(/(\d+)[-\/](\d+)[-\/](\d+)/, '\2-\1-\3')
  end
end