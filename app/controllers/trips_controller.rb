class TripsController < ApplicationController
    
    def index
        find_user
        @trips = @user.trips.all 
    end 

    def show
        find_user 
        find_trip 
    end 

    def new
        set_user
        find_attraction 
        @trip = Trip.new
    end

    def create
        set_user
        find_attraction
        @trip = @user.trips.build(trip_params)
        if @trip.save
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end

    private

    def find_user 
        @user = User.find_by(id: params[:user_id])
    end 

    def find_trip 
        @trip = Trip.find(params[:id])
    end 

    def find_attraction
        @attraction = Attraction.find_by(id: params[:attraction_id])
    end

    def trip_params 
        params.require(:trip).permit(:user_id, :attraction_id, :state_id, :comment)
    end
end 
