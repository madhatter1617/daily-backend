class SessionsController < ApplicationController
  def create
    # byebug
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
        render json: user
    else
        render json: {errors: "Invalid username and/or password"} 
    end 
end 
end


#     def create
#         user = User.find_or_create_by(username: params[:username])
#         session[:user_id] = user.id
#         render json: user
#       end

#       def destroy
#         session.delete :user_id
#         head :no_content
#       end
# end