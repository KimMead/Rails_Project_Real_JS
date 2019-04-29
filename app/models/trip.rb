class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :attraction
    validates :attraction, presence: true 

    def attraction_attributes=(attributes)
        if attributes[:attraction] != ""
            attraction = Attraction.find_or_create_by(name: attributes[:attraction])
            if attributes[:state] != ""
                state = State.find_or_create_by(name: attributes[:state])
        else 
            state = State.find_by(id: attributes[:state_id])
            end 
         end 
    end
end 
