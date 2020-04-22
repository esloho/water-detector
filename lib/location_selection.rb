require_relative 'score_calculation'
require_relative 'location_sorting'

module LocationSelection
  extend self

  def find_top_locations(t, n, grid)
    scores_grid, sorted_scores = get_sorted_area_scores(n, grid)
    print_top_locations(t, sorted_scores)

    scores_grid
  end

  def get_heatmap_data(n, grid)
    scores_grid, ignore_sorted_list = get_sorted_area_scores(n, grid)

    scores_grid
  end

  def get_sorted_area_scores(n, grid)
    last_pos = n - 1
    sorted_locations = nil
    scores_grid = []

    0.upto(last_pos) do |x|
      0.upto(last_pos) do |y|
        score = ScoreCalculation.get_area_score(x, y, n, grid)
        scores_grid.push([x, y, score])
        sorted_locations = LocationSorting.add_location(x, y, score, sorted_locations)
      end
    end

    [scores_grid, sorted_locations]
  end

  def print_top_locations(t, location)
    return if t == 0 || location.nil?

    puts "#{location.info}"

    print_top_locations(t-1, location.next_node)
  end

end
