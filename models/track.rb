# class track
class Track
  attr_reader :raw_data

  attr_reader :scheduled
  attr_reader :actual
  def initialize(raw_data)
    @raw_data = raw_data

    @scheduled = @raw_data.scheduled
    @actual = @raw_data.actual
  end
end
