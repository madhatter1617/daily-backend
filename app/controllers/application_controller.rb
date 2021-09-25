class ApplicationController < ActionController::Base
    
    include ActionController::Cookies
    def current_user
        User.find_by(id: session[:user_id])
    end
    def authorize
        return render json: {error: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end 

end
