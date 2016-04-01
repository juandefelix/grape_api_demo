class RecordSaver
  def initialize(input)
    @input = input
  end

  def save
    status = saved? ? 'ok' : 'failed'
    { status: status }
  end

  private

  def saved?
    record && List.write(record)
  end

  def record
    StringParser.new(@input).serialize_input
  end
end
