class UsersController < ApplicationController
    protect_from_forgery
    # wrap_parameters format: []

    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        
    
        def index 
            users = User.all
            render json: users
        end
    
        #GET /users/:id
    
        def show
            user = User.find_by(id: session[:user_id])
            if user
              render json: user
            else
              render json: { error: "Not authorized from user" }, status: :unauthorized
            end
        end
    
        # POST /users/:id
        def create
            user = User.create(user_params)
            session[:user_id] = user.id
            render json: user, status: :created 
        end

        # def create
        #     user = User.create!(user_params)
        #     session[:user_id] = user.id
        #     render json: user, status: :created
        # end
    
        #PATCH /users/:id
    
        # def update
        #     user = find_user
        #     user.update!(user_params)
        #     render json: user, status: :accepted
        # end
        
        #DESTROY /users/:id
    
        def destroy
            user = find_user    
            user.destroy
            head :no_content
        end
    
        private
        def find_user
            User.find(params[:id])
        end 
    
        def user_params
            params.permit(:username, :password)
        end 
    
        # def render_unprocessable_entity_response(invalid)
        #     render json: {erros: invalid.record.errors.full_messages}, status: :unprocessable_entity
        # end
    
        # def render_not_found_response(exception)
        #     render json: {error:"#{exception.model} not found"}, status: :not_found
        # end 
    end