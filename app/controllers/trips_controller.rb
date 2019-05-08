class TripsController < ApplicationController

    def new 
        set_user
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @trip = Trip.new 
    end 
     

    def create
    end 

    def index 
        @user = User.find_by(id: params[:user_id])
        @trips = @user.trips.all
    end 

    private

    def trip_params 
        params.require(:trip).permit(:user_id, :state_id)
    end 
end 