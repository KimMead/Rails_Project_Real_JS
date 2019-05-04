class AttractionsController < ApplicationController
   
    def new 
        if params[:state_id] && State.find_by_id(params[:state_id])
            @pet = vet.pets.build
        else 
            @attraction = Attraction.new 
        end 
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
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
        @attraction = Attraction.find(params[:id])
    end 

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :comment, :state_id)
    end 
end 