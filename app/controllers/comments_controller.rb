class CommentsController < ApplicationController

    def index
        @state = State.find_by_id(params[:state_id])
        if @state
            @comments = @state.comments 
        else 
            redirect_to states_path
        end 
    end 

    def new
        @state = State.find_by_id(params[:state_id])
        @comment = Comment.new 
        @comment = @state.comments.build
    end 

    def create
        @state = State.find_by_id(params[:state_id])
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
end