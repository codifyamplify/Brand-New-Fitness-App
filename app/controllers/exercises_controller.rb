class ExercisesController < ApplicationController
    # EXERCISE ROUTES
  # build READ route - GET all exercises (.all), get a specific exercise (.find)
  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json(include: [:user])
  end

  get '/exercises/:id' do
    exercise = find_exercise
    # add conditional - if exercise exists, else
    # if exercise
      exercise.to_json(include: [:user])
    # else
    #   { message: "Sorry, that exercise was not found."}.to_json
    # end
  end

  # build CREATE route - POST new exercise, (.create)
  post '/exercises' do
    # binding.pry
    exercise = Exercise.create(
      name: params[:name],
      muscle_group: params[:muscle_group],
      weight: params[:weight],
      sets: params[:sets],
      reps: params[:reps],
      rest: params[:rest],
      user_id: params[:user_id]
    )
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
    # binding.pry
    exercise = Exercise.find(params[:id])
    # binding.pry
    exercise.update(
      name: params[:updatedName],
      muscle_group: params[:updatedMuscleGroup],
      weight: params[:updatedWeight],
      sets: params[:updatedSets],
      reps: params[:updatedReps],
      rest: params[:updatedRest],
      user_id: params[:updatedUserId]
    )
    exercise.to_json(include: [:user])
    # binding.pry
  end

  private
  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
#   strong params
  # def exercise_params
  #   allowed_params = %w(name muscle_group weight sets reps rest user_id)
  #   params.select{|k,v| allowed_params.include?(k)}
  # end

  def find_exercise
    exercise = Exercise.find(params[:id])
  end

end