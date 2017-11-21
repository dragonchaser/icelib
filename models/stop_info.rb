# class StopInfo
class StopInfo
  attr_reader :raw_data

  attr_reader :scheduled_next_eva_nr
  attr_reader :actual_next_eva_nr
  attr_reader :actual_last_eva_nr
  attr_reader :actual_last_started
  attr_reader :final_station_name
  attr_reader :final_station_eva_nr

  attr_reader :scheduled_next
  attr_reader :actual_next
  attr_reader :actual_last
  attr_reader :final_station

  def initialize(raw_data, instance_parent_stops)
    @raw_data = raw_data
    @scheduled_next_eva_nr = @raw_data.scheduledNext
    @actual_next_eva_nr = @raw_data.actualNext
    @actual_last_eva_nr = @raw_data.actualLast
    @actual_last_started = @raw_data.actual_last_started
    @final_station_name = @raw_data.finalStationName
    @final_station_eva_nr = @raw_data.finalStationEvaNr

    @scheduled_next = instance_parent_stops.search_station(@raw_data.scheduledNext)
    @actual_next = instance_parent_stops.search_station(@raw_data.actualNext)
    @actual_last = instance_parent_stops.search_station(@raw_data.actualLast)
    @final_station = instance_parent_stops.search_station(@raw_data.finalStationEvaNr)
  end
end
