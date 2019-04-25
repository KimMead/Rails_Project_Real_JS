class StatesController < ApplicationController
    
    def index
        @states = State.all 
    end 

    def new
        @state = State.new
    end
    
    def create
        @state = State.new(state_params)
        if @state.save
          redirect_to show_path(@state)
        else
          render :new
        end
      end

    def show
        @state = State.find_by(id: params[:id])
    end 
end 