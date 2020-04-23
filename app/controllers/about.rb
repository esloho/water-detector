
WaterDetector::App.controllers :about do

  get :index do
    render 'about', :layout => 'application', :locals => {:title => "About"}
  end
end
