class UsersController < ApplicationController
    # USER ROUTES
  # build READ route - GET all users (.all), get a specific user (.find)
  get '/users' do
    users = User.all
    users.to_json(include: [:exercises])
  end

  get '/users/:id' do
    user = find_user
    user.to_json(include: [:exercises])
  end
  # build CREATE route - POST new user, (.create)
  post '/users' do
    user = User.create(user_params)
    user.to_json
  end

  delete '/users/:id' do
    user = find_user
    user.destroy
    user.to_json
  end

  patch '/users/:id' do
    user = find_user
    user.update(user_params)
    user.to_json
  end

  private
  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def user_params
    allowed_params = %w(name)
    params.select{|k,v| allowed_params.include?(k)}
  end

  def find_user
    User.find(params[:id])
  end

end