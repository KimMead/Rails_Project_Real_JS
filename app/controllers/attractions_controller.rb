class AttractionsController < ApplicationController
    before_action :require_login 

    def new 
        @attraction = Attraction.new
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
        find_attraction
        if !@attraction 
            redirect_to attractions_path 
        end 
    end 

    def edit 
        find_attraction 
        if !@attraction
            redirect_to attractions_path 
        end 
    end 

    def update  
        find_attraction 
        if @attraction.update(attraction_params)
            redirect_to attraction_path
        else
            render :edit
        end 
    end 
    
    def destroy  
        find_attraction
        @attraction.destroy 
        redirect_to attractions_path(@user)
    end 

    
    private

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :likes, :state_id, state_attributes: [:name])
    end 

    def find_attraction 
        @attraction = Attraction.find_by(id: params[:id])
    end 
end 

