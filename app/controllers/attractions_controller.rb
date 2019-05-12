class AttractionsController < ApplicationController
    before_action :require_login 

    def new 
        @user = User.find_by(id: params[:user_id])
        @state = State.find_by(id: params[:state_id])
        @attraction = Attraction.new
    end
       
    def create
        @user = User.find_by(id: params[:user_id])
        @state = State.find_by(id: params[:state_id])
        @attraction = @user.attraction.create(attraction_params)
        if @attraction.save
        redirect_to attraction_path(@attraction)
        else
            render :new 
        end 
    end

    def index
        if !logged_in? 
            redirect_to '/'
        end 
        if params[:state_id] && state = State.find_by_id(params[:state_id])
            @attractions = state.attractions 
        end 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
    end 
    
    private

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :state_id, state_attributes: [:name])
    end 
end 

