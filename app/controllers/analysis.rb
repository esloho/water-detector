require_relative '../../lib/location_selection'

WaterDetector::App.controllers :analysis do

  get :index do
    @size = 4
    grid = ([2, 3, 2, 1, 4, 4, 2, 0, 3, 4, 1, 1, 2, 3, 4, 4]).to_a

    @data, @max_score = LocationSelection.get_heatmap_data(@size, grid)

    render 'analysis'
  end
end
