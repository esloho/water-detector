module ScoreCalculator
  extend self

  def calculate_score(coord_x, coord_y, n, grid)
    limits_x = get_limits(coord_x, n)
    limits_y = get_limits(coord_y, n)

    score = 0

    limits_x[0].upto(limits_x[1]) do |i|
      limits_y[0].upto(limits_y[1]) do |j|
        score += get_measurement(i, j, n, grid)
      end
    end

    score

  end

  def get_limits(coord, n)
    max = n - 1
    starting_point = coord - 1 > 0 ? coord - 1 : 0
    ending_point = coord + 1 < max ? coord + 1 : max

    [starting_point, ending_point]
  end

  def get_measurement(i, j, n, grid)
    grid[i*n + j]
  end
  end
