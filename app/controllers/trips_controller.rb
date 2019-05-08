class TripsController < ApplicationController

    def new 
        set_user
        @state = State.find_by_id(params[:state_id])
        @trip = Trip.new 
    end  
     

    def create
        set_user
        @state = State.find_by_id(params[:state_id])
        @trip = @user.trips.build(trip_params)
        if @trip.save 
            redirect_to user_trips_path(@user)
        else 
            render:new 
        end 
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