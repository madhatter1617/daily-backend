class EntriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

    
    def index
        # session[:user_id] = "user"
        # puts "WHATS UP PARTY PEOPLE THIS IS #{current_user ? current_user.username : "NOT LOGGED IN"}"
# byebug
        if current_user == nil
            render json:[]
        else
            entries = current_user.entries
            render json: entries 
        end
    end


    def update
        entry = Entry.find_by(id: params[:id]) 
        entry.update(
            entry_text: params[:entry_text],
            title: params[:title]
        )
        render json: entry
    end


    def show 
        entry = Entry.find(params[:id])
        render json:entry
    end

    # def create
    #     entry = Entry.create!(entry_params)
    #     render json: entry, status: :created
    #     rescue ActiveRecord::RecordInvalid => invalid 
    #     render json: {errors: invalid.record.errors.full_messages}
    # end 
    
    def create
        entry = Entry.new(entry_params)
        journal_id = Journal.all.sample.id
        user_id = current_user.id
        entry.journal_id = journal_id
        entry.user_id = user_id
        entry.save
        render json: entry, status: :created
    end


    def destroy
        entry = Entry.find_by(id: params[:id]) 
        # entry.destroy
        # entry.to_json
        render json: entry.destroy 
        head :no_content
        
    end


    private

    # def find_entry
    #     Entry.find(params[:id])
    # end

    def entry_params
        params.permit(:title, :entry_text, :user_id, :journal_id)
    end

    def invalid_response(invalid)
        render json: {errors: "validation errors"}, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
        render json: {error:"#{exception.model} not found"}, status: :not_found
    end 
end