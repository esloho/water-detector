require_relative 'lib/location_selection'

def read_input
  t, n, *grid = ARGV
  grid_i = grid.map(&:to_i)

  [t.to_i, n.to_i, grid_i]
end

def print_help
  puts "\n**** Water detection in Mars program ****"
  puts "COMMAND: water_detector t n grid"
  puts "t = number of results requested"
  puts "n = size of the grid"
  puts "grid = space delimited list of numbers that form the grid"
end

def validate_data(t, n, grid)
  begin
    raise 'Error: insufficient number of arguments' if t.nil? || n.nil? || grid.nil?
    raise 'Error: The n is inconsistent with the length of the grid' unless n**2 == grid.length
  rescue Exception => e
    puts "#{e}"
    print_help
  end
end

def get_top_locations(t, n, grid)
  sorted_scores = LocationSelection.get_sorted_area_scores(n, grid)
  LocationSelection.print_top_locations(t, sorted_scores)
end


t, n, grid = read_input
validate_data(t, n, grid)

get_top_locations(t, n, grid)
