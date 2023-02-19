class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to Brand New Fitness App!" }.to_json
  end

end
# note to self: do not forget to convert your responses into json with to_json as your last step for each request

# plan application_controller
