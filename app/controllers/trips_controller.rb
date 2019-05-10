class TripsController < ApplicationController

    def new 
        if params[:state_id] && state = State.find_by_id(params[:state_id])
        @trip = state.trips.build 
        else 
        @trip = Trip.new 
        @trip.build_state 
        end 
    end
       
    def create
        @trip = current_user.trips.build(trip_params)
        if @trip.save 
            redirect_to trip_path(@trip)
        else 
            @trip.build_state 
            render :new 
        end 
    end

    def index
        if !logged_in?
            redirect_to '/'
          end
          if params[:state_id] && state = State.find_by_id(params[:state_id])
            @trips = state.trips
        end
    end 

    def show 
        @trip = Trip.find_by(id: params[:id])
    end 
    
    
    private

    def trip_params 
        params.require(:trip).permit(:attraction, :user_id, :state_id, state_attributes: [:name] )
    end 
end 