require_relative 'lib/input/input_data'
require_relative 'lib/analysis/soil_analyzer'

def print_help
  puts "\n********* Water detection in Mars program *********\n\n"
  puts "COMMAND: water_detector [t] [n] [grid]"
  puts "\nt    = number of results requested"
  puts "n    = size of the grid"
  puts "grid = space delimited list of numbers forming the grid"
  puts "\n***************************************************\n"
end

def print_locations(locations)
  locations.each do | message |
    puts message
  end
end

def main
  begin
    input_t, input_n, *input_grid = ARGV
    t, n, grid = InputData.parse(input_t, input_n, input_grid)

    return puts "No results requested" if t == 0

    _, top_locations = SoilAnalyzer.get_water_concentration(t, n, grid)
    print_locations(top_locations)

  rescue Exception => e
    puts "#{e}"
    print_help
  end
end

main
