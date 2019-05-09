class TripsController < ApplicationController

    def new 
        if params[:state_id] && state = State.find_by_id(params[:state_id])
            #nested route
            @state = state.trips.build #has_many
        else
            #unnested
            @state = State.new
              #belongs_to
        end
    end  
     
    def create
        @trip = current_user.trips.build(trip_params)
        if @trip.save
            redirect_to trips_path(@user)

        else
            render :new
        end
    end

    def index 
        @user = User.find_by(id: params[:user_id])
        @trips = @user.trips.all
    end 

    def show 
        @trip = Trip.find_by(id: params[:id])
        if !@trip 
            redirect_to trips_path
        end
    end 

    private

    def trip_params 
        params.require(:trip).permit(:user_id, :state_id, state_attributes:[:attraction])
    end 
end 