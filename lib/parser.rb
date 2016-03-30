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
    { last: $1, first: $2, gender: $3, color: $4, dob: $5 } if raw_input =~ FORMAT_REGEX
  end
end