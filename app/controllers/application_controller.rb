class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end

  get '/' do
    "Welcome to Brand New Fitness App!"
  end

# note to self: do not forget to convert your responses into json with to_json as your last step for each request

# USER ROUTES
  # build READ route - GET all users (.all), get a specific user (.find)
  get '/users' do
    users = User.all
    users.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end
  # build CREATE route - POST new user, (.create)

# EXERCISE ROUTES
  # build READ route - GET all exercises (.all), get a specific exercise (.find)
  # build CREATE route - POST new exercise, (.create)
  # build DELETE route - DELETE specific route, (.find, .destroy)
  # build UPDATE route - PATCH specific route, (.update)



end


# plan application_controller
