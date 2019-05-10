class TripsController < ApplicationController

    def index 
        find_user 
        @trips = Trip.all 
    end 

    def show 
        find_user 
        @trip = Trip.find_by(id: params[:id])
    end 
    
    def new 
        set_user 
        @state = State.find_by(id: params[:state_id])
        @trip = Trip.new   
    end  
     
    def create
        set_user 
        @state = State.find_by(id: params[:state_id])
        @trip = @user.trips.build(trip_params)
        if @trip.save 
            redirect_to trips_path(@user )

        else
            @trip.build_state 
            render :new
        end
    end

   

    private

    def find_user
        @user = User.find_by(id: params[:user_id])
    end 

    def trip_params 
        params.require(:trip).permit(:user_id, :state_id, :attraction)
    end 
end 