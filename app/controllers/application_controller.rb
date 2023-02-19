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
  post '/users' do
    user = User.create(
      name: params[:name]
    )
    user.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

# EXERCISE ROUTES
  # build READ route - GET all exercises (.all), get a specific exercise (.find)
  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json
  end

  get '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.to_json
  end

  # build CREATE route - POST new exercise, (.create)
  post '/exercises' do
    exercise = Exercise.create(
      name: params[:name],
      muscle_group: params[:muscle_group],
      weight: params[:weight],
      sets: params[:sets],
      reps: params[:reps],
      rest: params[:rest],
      user_id: params[:user_id]
    )
    exercise.to_json
  end

  # build DELETE route - DELETE specific route, (.find, .destroy)
  delete '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.destroy
    exercise.to_json
  end

  # build UPDATE route - PATCH specific route, (.update)



end


# plan application_controller
