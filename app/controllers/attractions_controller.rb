class AttractionsController < ApplicationController
   
    def new 
        @attraction = Attraction.new 
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        if @attraction.save 
            
            redirect_to attraction_path(@attraction)
        else 
            render :new
        end 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
    end 

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :state_id, state_name:[:state])
    end 
end 