require 'set'

states_needed = Set.new(%w[mt wa or id nv ut ca ar])

stations = {}
stations['kone'] = Set.new(%w[id nv ut])
stations['ktwo'] = Set.new(%w[wa id mt])
stations['kthree'] = Set.new(%w[or nv ca])
stations['kfour'] = Set.new(%w[nv ut])
stations['kfive'] = Set.new(%w[ca ar])

final_stations = Set.new

until states_needed.empty?
  best_station = nil
  states_covered = Set.new

  stations.each do |station, states_for_station|
    covered = states_needed & states_for_station
    if covered.size > states_covered.size
      best_station = station
      states_covered = covered
    end
  end

  final_stations << best_station
  states_needed -= states_covered
end

p final_stations