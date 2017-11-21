require_relative 'stop_info.rb'
require_relative 'stops.rb'
# class train
class Train
  attr_reader :raw_data_trip_status

  attr_reader :connection
  attr_reader :service_level
  attr_reader :speed
  attr_reader :gps_trip_info
  attr_reader :latitude
  attr_reader :longitude
  attr_reader :server_time
  attr_reader :wagon_class
  attr_reader :navigation_change

  attr_reader :raw_data_trip_info

  attr_reader :trip_date
  attr_reader :train_type
  attr_reader :vzn
  attr_reader :actual_postition
  attr_reader :distance_from_last_stop
  attr_reader :total_distance
  attr_reader :stop_info
  attr_reader :stops
  attr_reader :info

  attr_reader :progress_current
  attr_reader :progress_total

  def initialize(raw_data_status, raw_data_trip_info)
    @raw_data_status = raw_data_status
    parse_raw_data_status
    @raw_data_trip_info = raw_data_trip_info
    parse_raw_data_trip_info

    calculate_progress_current
    calculate_progress_total
  end

  def get_progress_current_bar(length, encode = nil)
    get_bar(length, @progress_current, encode)
  end

  def get_progress_total_bar(length, encode = nil)
    get_bar(length, @progress_total, encode)
  end

  def get_bar(length, base, encode = nil)
    train_pos = length / 100 * base
    bar = ''
    (1..length).each do |p|
      if p < train_pos - 4
        bar << '_'
      elsif p < train_pos
        bar << "\u1F68B".encode('utf-8') if encode == 'utf-8'
        bar << '=' if encode != 'utf-8'
      elsif p == train_pos
        bar << "\u1F68A".encode('utf-8') if encode == 'utf-8'
        bar << '>' if encode != 'utf-8'
      elsif p > train_pos
        bar << '_'
      end
    end
    bar
  end

  private

  def parse_raw_data_status
    @connection = @raw_data_status.connection
    @service_level = @raw_data_status.servicelevel
    @speed = @raw_data_status.speed
    @gps_status = @raw_data_status.gpsStatus
    @latitude = @raw_data_status.latitude
    @longitude = @raw_data_status.longitude
    @server_time = @raw_data_status.serverTime
    @wagon_class = @raw_data_status.wagonClass
    @navigation_change = @raw_data_status.navigationChange
  end

  def parse_raw_data_trip_info
    @trip_date = @raw_data_trip_info.tripDate
    @train_type = @raw_data_trip_info.trainType
    @vzn = @raw_data_trip_info.vzn
    @actual_postion = @raw_data_trip_info.actualPosition
    @distance_from_last_stop = @raw_data_trip_info.distanceFromLastStop
    @total_distance = @raw_data_trip_info.totalDistance
    @stops = Stops.new(@raw_data_trip_info.stops)
    @stop_info = StopInfo.new(@raw_data_trip_info.stopInfo, @stops)
    # TODO: this is an object, implement!
    @info = @raw_data_trip_info.info
    puts raw_data_trip_info.info
  end

  def calculate_progress_current
    @progress_current = @stop_info.actual_last.info.distance /
                        ((@stop_info.actual_last.info.distance +
                          @stop_info.actual_next.info.distance) / 100)
  end

  def calculate_progress_total
    @progress_total = @actual_postion / (@total_distance / 100)
  end
end
