require 'open-uri'
require 'json'

require_relative 'models/train'

# IceLib Class
class IceLib
  attr_reader :train

  def initialize
    refresh
  end

  def refresh
    refresh_status
    refresh_trip_info

    @train = Train.new(@status, @trip_info)
  end

  def station(eva_nr)
    @stops.each do |s|
      return s if s.station.evaNr == eva_nr
    end
    nil
  end

  private

  def refresh_status
    if ENV['MOCK'] == 'true'
      @status = JSON.parse(File.read('mock/status.txt').chomp,
                           object_class: OpenStruct)
    else
      open('https://portal.imice.de/api1/rs/status') do |f|
        f.each do |line|
          @status = JSON.parse(line.chomp, object_class: OpenStruct)
        end
      end
    end
  end

  def refresh_trip_info
    if ENV['MOCK'] == 'true'
      @trip_info = JSON.parse(File.read('mock/tripInfo.txt').chomp,
                              object_class: OpenStruct)
    else
      open('https://portal.imice.de/api1/rs/tripInfo') do |f|
        f.each do |line|
          @trip_info = JSON.parse(line.chomp, object_class: OpenStruct)
        end
      end
    end
  end
end
