require_relative 'score_calculation'
require_relative '../location/sorting'

module SoilAnalyzer
  extend self

  def get_water_concentration(t, n, grid)
    scores_grid, sorted_scores = get_sorted_area_scores(n, grid)
    top_locations = get_top_locations_info([], t, sorted_scores)

    [scores_grid, top_locations]
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

  def get_top_locations_info(messages, t, location)
    return messages if t == 0 || location.nil?

    messages.push("#{location.info}")

    get_top_locations_info(messages, t-1, location.next_node)
  end

end
