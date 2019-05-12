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
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save
        redirect_to attraction_path(@attraction)
        else
            render :new 
        end 
    end

    def index
        if logged_in?
        @user = User.find_by(id: params[:user_id])
        @attractions = current_user.attractions.all 
        end 
    end 

    def show
        @user = User.find_by(id: params[:user_id]) 
        @attraction = Attraction.find(params[:id])
    end 

    def edit 
        set_user 
        @attraction = Attraction.find(params[:id])
        if @attraction.user != current_user 
            redirect_to attractions_path(@user)
        end 
    end 

    def update 
        set_user 
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@user)
        else
            render :edit
        end 
    end 
    
    def destroy  
        set_user
        @attraction = Attraction.find(params[:id])
        @attraction.destroy 
        redirect_to attractions_path(@user)
    end 

    private

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :state_id, state_attributes: [:name])
    end 
end 

