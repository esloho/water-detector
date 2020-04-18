module InputData
  extend self

  def read_input
    begin
      input_t, input_n, *input_grid = ARGV
      t = input_t.to_i
      n = input_n.to_i
      grid = input_grid.map(&:to_i)

      validate(t, n, grid)

      [t, n, grid]

    rescue Exception => e
      puts "#{e}"
      print_help
      exit
    end
  end

  def print_help
    puts "\n**** Water detection in Mars program ****"
    puts "COMMAND: water_detector t n grid"
    puts "t = number of results requested"
    puts "n = size of the grid"
    puts "grid = space delimited list of numbers that form the grid"
  end

  def validate(t, n, grid)
    raise 'Error: insufficient number of arguments' if t.nil? || n.nil? || grid.nil?
    raise 'Error: The n is inconsistent with the length of the given grid' unless n**2 == grid.length
  end
end
