class AttractionsController < ApplicationController
   
    def new 
        if params[:state_id] && state = State.find_by_id(params[:state_id])
            @attraction = state.attractions.build
        else 
            @attraction = Attraction.new 
        end 
    end 

    def create 
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else 
            render :new
        end 
    end 

    def index
        @attractions = Attraction.all 
    end 

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        if !@attraction 
            redirect_to attraction_path 
        end 
    end 

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :comment, :state_id)
    end 
end 