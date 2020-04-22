require_relative '../../lib/location_selection'

WaterDetector::App.controllers :analysis do

  get :index do
    render 'analysis'
  end

  post :index do
    @number_results, @size, grid = InputData.transform(params[:t], params[:n], params[:grid])

    @data = LocationSelection.get_heatmap_data(@size, grid)

    render 'analysis'
  end
end
