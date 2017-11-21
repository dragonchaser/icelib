# class timetable
class Timetable
  attr_accessor :raw_data

  attr_accessor :scheduled_arrival_time
  attr_accessor :actual_arrival_time
  attr_accessor :arrival_delay
  attr_accessor :scheduled_departure_time
  attr_accessor :actual_departure_time
  attr_accessor :departure_delay

  def initialize(raw_data)
    @raw_data = raw_data
    @arrival_delay = @raw_data.arrivalDelay
    @departure_delay = @raw_data.departureDelay
    fix_timestamps
  end

  private

  def fix_timestamps
    if @raw_data.scheduledArrivalTime.nil?
      @scheduled_arrival_time = nil
    else
      @scheduled_arrival_time = @raw_data.scheduledArrivalTime / 1000
    end
    if @raw_data.actualArrivalTime.nil?
      @actual_arrival_time = nil
    else
      @actual_arrival_time = @raw_data.actualArrivalTime / 1000
    end
    if @raw_data.scheduledDeparture.nil?
      @scheduled_departure_time = nil
    else
      @scheduled_departure_time = @raw_data.scheduledDeparture / 1000 \
    end
    if @raw_data.actualDepartureTime.nil?
      @actual_departure_time = nil
    else
      @actual_departure_time = @raw_data.actualDepartureTime / 1000
    end
  end
end
