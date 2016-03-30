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
    [$1, $2, $3, $4, $5].join(', ') if raw_input =~ FORMAT_REGEX
  end
end