class StatesController < ApplicationController
    
    def index
        @states = State.all 
    end 

    def show
        @state = State.find_by(id: params[:id])
    end 

    def most_visited 
        @state = State.most_visited.first 
    end 

    private 
    def state_params 
        params.require(:state).permit(:name)
    end 
end 