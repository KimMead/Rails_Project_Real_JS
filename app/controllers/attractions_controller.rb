class AttractionsController < ApplicationController

    def index
        
    end 

    def show 
        
    end 
    
    
    def new 
        if params[:state_id] && state = State.find_by_id(params[:state_id])
        @attraction = state.attractions.build 
        else 
        @attraction = Attraction.new 
        @attraction.build_state
        end 
    end
       
    def create
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else
            @attraction.build_state 
            render :new 
        end 
    end

    private

    def attraction_params 
        params.require(:attraction).permit(:user_id, :state_id, :name, :location, state_attributes: [:name])
    end 
end 

