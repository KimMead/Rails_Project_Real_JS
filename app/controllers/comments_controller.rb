class CommentsController < ApplicationController
    
    def index
        find_state
        if @state
            @comments = @state.comments 
        else 
            redirect_to states_path
        end 
    end 

    def new
        find_state
        @comment = @state.comments.build
    end 

    def create
        find_state
        @comment = current_user.comments.build(comments_params)
        @comment.state = @state 
        if @comment.save 
            redirect_to state_path(@comment.state)
        else 
            render :new 
        end 
    end 

    private 
    
    def comments_params 
        params.require(:comment).permit(:content)
    end 

    def find_state 
        @state = State.find_by(id: params[:state_id])
    end 
end