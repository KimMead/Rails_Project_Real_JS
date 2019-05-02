class StatesController < ApplicationController
    
    
    
    def show
        @state = State.find_by(id: params[:id])
    end 
end 