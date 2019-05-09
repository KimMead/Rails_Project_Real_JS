class StatesController < ApplicationController
    
    def index
        @states = State.all 
    end 

    def show
        @state = State.find_by(id: params[:id])
    end 

end 