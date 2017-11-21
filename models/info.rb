# class info
class Info
  attr_reader :raw_data

  attr_reader :status
  attr_reader :passed
  attr_reader :distance
  attr_reader :distance_from_start

  def initialize(raw_data)
    @raw_data = raw_data
    @status = @raw_data.status
    @passwd = @raw_data.passed
    @distance = @raw_data.distance
    @distance_from_start = @raw_data.distance_from_start
  end
end
