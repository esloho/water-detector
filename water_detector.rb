require_relative 'lib/input_data'
require_relative 'lib/location_selection'

def print_help
  puts "\n**** Water detection in Mars program ****"
  puts "COMMAND: water_detector t n grid"
  puts "t = number of results requested"
  puts "n = size of the grid"
  puts "grid = space delimited list of numbers that form the grid"
end

begin
  input_t, input_n, *input_grid = ARGV
  t, n, grid = InputData.transform(input_t, input_n, input_grid)

  LocationSelection.find_top_locations(t, n, grid)
rescue Exception => e
  puts "#{e}"
  print_help
end
