class ExercisesController < ApplicationController
    # EXERCISE ROUTES
  # build READ route - GET all exercises (.all), get a specific exercise (.find)
  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json(include: [:user])
  end

  get '/exercises/:id' do
    exercise = find_exercise
    exercise.to_json(include: [:user])
  end

  # build CREATE route - POST new exercise, (.create)
  post '/exercises' do
    exercise = Exercise.create(exercise_params)
    exercise.to_json(include: [:user])
  end

  # build DELETE route - DELETE specific route, (.find, .destroy)
  delete '/exercises/:id' do
    exercise = find_exercise
    exercise.destroy
    exercise.to_json
  end

  # build UPDATE route - PATCH specific route, (.update)
  patch '/exercises/:id' do
    exercise = find_exercise
    exercise.update(exercise_params)
    exercise.to_json(include: [:user])
  end

  private
  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
#   strong params
  def exercise_params
    allowed_params = %w(name muscle_group weight sets reps rest user_id)
    params.select{|k,v| allowed_params.include?(k)}
  end

  def find_exercise
    Exercise.find(params[:id])
  end

end