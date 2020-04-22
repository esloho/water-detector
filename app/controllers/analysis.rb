require_relative '../../lib/location_selection'

WaterDetector::App.controllers :analysis do

  get :index do
    render 'analysis/index'
  end

  post :index do
    begin
      t = params[:t] || 0
      @number_results, @size, grid = InputData.parse(t, params[:n], params[:grid])

      @data, @top_locations = LocationSelection.analyze_locations(@number_results, @size, grid)

      render 'analysis/results'

    rescue Exception => e
      @error = e
      render 'analysis/index'
    end
  end
end
