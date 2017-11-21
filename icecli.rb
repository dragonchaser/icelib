#!/usr/bin/env ruby
require_relative 'icelib'
puts '================> running in mock mode' if ENV['MOCK'] == 'true'
il = IceLib.new
puts "Trip Date : #{il.train.trip_date}\t\t\tTrain : #{il.train.train_type} #{il.train.vzn}"
puts "From      : #{il.train.stops.first.station.name}\t\tTo : #{il.train.stops.last.station.name}"
puts "Speed     : #{il.train.speed} km/h"
if il.train.stop_info.actual_next.timetable.scheduled_arrival_time == il.train.stop_info.actual_next.timetable.actual_arrival_time
  next_arrival_time = Time.at(il.train.stop_info.actual_next.timetable.scheduled_arrival_time).to_s[11, 8]
else
  next_arrival_time = " (#{il.train.stop_info.actual_next.timetable.arrival_delay}) #{Time.at(il.train.stop_info.actual_next.timetable.actual_arrival_time).to_s[11, 8]} (#{Time.at(il.train.stop_info.actual_next.timetable.scheduled_arrival_time).to_s[11, 8]}) "
end
if il.train.stop_info.actual_next.track.scheduled == il.train.stop_info.actual_next.track.actual
  next_track = il.train.stop_info.actual_next.track.scheduled
else
  next_track = "#{il.train.stop_info.actual_next.track.actual} (scheduled: #{il.train.stop_info.actual_next.track.scheduled})"
end
puts "Next stop :#{next_arrival_time}#{il.train.stop_info.actual_next.station.name} [track: #{next_track}]"
if il.train.stop_info.actual_last.timetable.scheduled_arrival_time == il.train.stop_info.actual_last.timetable.actual_arrival_time
  last_arrival_time = Time.at(il.train.stop_info.actual_last.timetable.scheduled_arrival_time).to_s[11, 8]
else
  last_arrival_time = "(#{il.train.stop_info.actual_last.timetable.arrival_delay}) #{Time.at(il.train.stop_info.actual_last.timetable.actual_arrival_time).to_s[11, 8]} (#{Time.at(il.train.stop_info.actual_last.timetable.scheduled_arrival_time).to_s[11, 8]}) "
end
if il.train.stop_info.actual_last.track.scheduled == il.train.stop_info.actual_last.track.actual
  last_track = il.train.stop_info.actual_last.track.scheduled
else
  last_track = "#{il.train.stop_info.actual_last.track.actual} (scheduled: #{il.train.stop_info.actual_last.track.scheduled})"
end
puts "Last stop : #{last_arrival_time} #{il.train.stop_info.actual_last.station.name} [track: #{last_track}]"
