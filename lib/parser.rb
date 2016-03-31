require 'pry-byebug'
class StringParser
  FORMAT_REGEX =  Regexp.union([
    /\s?(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s([\d\/-]+)\s?/,
    /\s?(\w+),\s?(\w+),\s?(\w+),\s?(\w+),\s?([\d\/-]+)\s?/
  ])

  attr_reader :user_input

  def initialize(user_input)
    @user_input = user_input
  end

  def serialize_input
    [$1, $2, $3, $4, $5].join(',') if user_input =~ FORMAT_REGEX
  end

  private

  def valid_string?
    
  end
end