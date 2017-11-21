require_relative 'geocoordinates'
require_relative 'timetable'

# class station
class Station
  attr_reader :raw_data

  attr_reader :eva_nr
  attr_reader :name
  attr_reader :geocoordinates

  def initialize(raw_data)
    @raw_data = raw_data
    @eva_nr = @raw_data.evaNr
    @name = @raw_data.name
    @geocoordinates = Geocoordinates.new(@raw_data.geocoordinates)
  end
end
