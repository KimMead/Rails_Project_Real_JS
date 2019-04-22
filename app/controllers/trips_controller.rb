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
    end

    private

    def find_user 
        @user = User.find_by(id: params[:user_id])
    end 

    def find_trip 
        @trip = Trip.find(params[:id])

    def find_city
        @attraction = Attraction.find_by(id: params[:attraction_id])
    end

    def trip_params 
        params.require(:trip).permit(:user_id, :attraction_id, , state:id, :comment)
    end
end 
