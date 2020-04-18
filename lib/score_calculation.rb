module ScoreCalculation
  extend self

  def get_area_score(coord_x, coord_y, n, grid)
    starting_x, ending_x = get_limits(coord_x, n)
    starting_y, ending_y = get_limits(coord_y, n)

    score = 0

    starting_x.upto(ending_x) do |i|
      starting_y.upto(ending_y) do |j|
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
