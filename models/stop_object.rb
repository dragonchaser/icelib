# class stop_object
class StopObject
  attr_reader :station
  attr_reader :timetable
  attr_reader :track
  attr_reader :info

  def initialize(station, timetable, track, info)
    @station = station
    @timetable = timetable
    @track = track
    @info = info
  end
end
