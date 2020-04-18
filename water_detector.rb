require_relative 'lib/input_data'
require_relative 'lib/location_selection'


t, n, grid = InputData.read_input

LocationSelection.find_top_locations(t, n, grid)
