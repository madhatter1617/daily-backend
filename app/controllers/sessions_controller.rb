class SessionsController < ApplicationController
    # protect_from_forgery
    skip_before_action :authorize, only: [:create]
    skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
    
  def create
    # byebug
    user = User.find_by(username: params[:username])
    # byebug
    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
        render json: user
    else
        render json: {errors: "Invalid username and/or password"}, status: :unauthorized
    end 
end 

      def destroy
        session.delete :user_id
        head :no_content
      end
end