class LikesController < ApplicationController
    before_action :find_attraction

   def create
     @attraction.like.create(user_id: current_user.id)
     redirect_to attraction_path(@attraction)
   end

   private

    def find_attraction 
    @attraction = Attraction.find_by(id: params[:id])
    end 
   
 end