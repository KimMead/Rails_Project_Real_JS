class AttractionsController < ApplicationController
    before_action :require_login 

    def new 
        find_user 
        find_state 
        @attraction = Attraction.new
    end
       
    def create
        find_user 
        find_state
        @attraction = current_user.attractions.build(attraction_params)
        if @attraction.save
        redirect_to attraction_path(@attraction)
        else
            render :new 
        end 
    end

    def index
        if logged_in?
        find_user 
        @attractions = current_user.attractions.all 
        end 
    end 

    def show
        find_user  
        find_attraction
        if !@attraction 
            redirect_to attractions_path 
        end 
    end 

    def edit 
        set_user 
        find_attraction 
        if @attraction.user != current_user 
            redirect_to attractions_path(@user)
        end 
    end 

    def update 
        set_user 
        find_attraction
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@user)
        else
            render :edit
        end 
    end 
    
    def destroy  
        set_user
        find_attraction
        @attraction.destroy 
        redirect_to attractions_path(@user)
    end 

    private

    def attraction_params 
        params.require(:attraction).permit(:name, :location, :state_id, state_attributes: [:name])
    end 

    def find_user
        @user = User.find_by(id: params[:user_id])
    end 

    def find_state 
        @state = State.find_by(id: params[:state_id])
    end 

    def find_attraction 
        @attraction = Attraction.find(params[:id])
    end 
end 

