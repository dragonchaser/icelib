require 'forwardable'
require_relative 'info.rb'
require_relative 'station.rb'
require_relative 'stop_object.rb'
require_relative 'timetable.rb'
require_relative 'track.rb'

# class stops
class Stops
  include Enumerable
  extend Forwardable
  def_delegators :@data, :each, :<<, :last
  attr_reader :raw_data

  attr_reader :data

  def initialize(raw_data)
    @raw_data = raw_data
    @data = []
    @raw_data.each do |r|
      @data << StopObject.new(Station.new(r.station),
                              Timetable.new(r.timetable),
                              Track.new(r.track),
                              Info.new(r.info))
    end
  end

  def search_station(eva_nr)
    @data.each do |d|
      return d if d.station.eva_nr == eva_nr
    end
  end
end
