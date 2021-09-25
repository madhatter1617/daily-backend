class SessionsController < ApplicationController
    protect_from_forgery
    skip_before_action :authorize, only: [:create]
    
  def create
    # byebug
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
        render json: user
    else
        render json: {errors: "Invalid username and/or password"}, status: :unauthorized
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