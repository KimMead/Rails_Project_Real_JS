class StatesController < ApplicationController
    
    def index
        @states = State.all 
    end 

    def create 
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else 
            render :new
        end 
    end 

    def show
        @state = State.find_by(id: params[:id])
    end 

end 