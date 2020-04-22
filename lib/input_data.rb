module InputData
  extend self

  def transform(input_t, input_n, input_grid)
    t = input_t.to_i
    n = input_n.to_i

    input_grid = convert_to_array(input_grid) unless input_grid.is_a?(Array)
    grid = input_grid.map(&:to_i)

    validate(t, n, grid)

    [t, n, grid]
  end

  def convert_to_array(input_grid)
    return input_grid.split(' ') if input_grid.include?(' ')

    return input_grid.split(',') if input_grid.include?(',')

    raise 'Error: input grid numbers can only be delimited by spaces or commas'
  end

  def validate(t, n, grid)
    raise 'Error: insufficient number of arguments' if t.nil? || n.nil? || grid.nil?
    raise 'Error: The n is inconsistent with the length of the given grid' unless n**2 == grid.length
  end
end
