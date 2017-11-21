# class geocoordinates
class Geocoordinates
  attr_reader :raw_data

  attr_reader :latitude
  attr_reader :longitude

  def initialize(raw_data)
    @raw_data = raw_data
    @latitude = @raw_data.latitude
    @longitude = @raw_data.longitude
  end
end
