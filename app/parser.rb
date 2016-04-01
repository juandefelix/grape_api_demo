require 'pry-byebug'
class StringParser
  FORMAT_REGEX = Regexp.union([/\s?(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s(\w+)\s\|\s([\d\/-]+)\s?/,
                               /\s?(\w+),\s?(\w+),\s?(\w+),\s?(\w+),\s?([\d\/-]+)\s?/])

  attr_reader :user_input

  def initialize(user_input)
    @user_input = user_input
  end

  def serialize_input
    if match_object = FORMAT_REGEX.match(user_input)
      match_object.to_a[1..-1].compact.join(',')
    end
  end
end
