class AttractionsController < ApplicationController
   
    def new 
        @user = User.find_by(id: params[:user_id])
        if params[:state_id] && state = State.find_by_id(params[:state_id])
            @attraction = state.attractions.build
        else 
            @attraction = Attraction.new 
        end 
    end 

    def create 
        @user = User.find_by(id: params[:user_id])
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save 
            redirect_to attraction_path(@attraction)
        else
            render :new 
        end 
    end 

    def index
        @user = User.find_by(id: params[:user_id])
        @attractions = Attraction.all
    end 

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        if !@attraction 
            redirect_to attractions_path 
        end 
    end 

    def update 
        @attraction = Attraction.find_by(id: params[:id])
        if !@attraction 
            redirect_to attractions_path 
            if @attraction.update(attraction_params)
                redirect_to attraction_path(@path)
            else 
                render :edit 
            end 
        end 
    end 

    def destroy 
        @attraction = Attraction.find_by(id: params[:id])
        if !@attraction 
            redirect_to attractions_path
            @attraction.destroy 
            redirect_to attractions_path(@user)
        end 
    end 

    private 

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :comment, :state_id)
    end 
end 