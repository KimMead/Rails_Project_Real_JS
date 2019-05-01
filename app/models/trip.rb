class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :state
    validates :state, presence: true 

    def state_attributes=(attributes)
        if attributes[:state] != ""
            state = State.find_by(name: attributes[:state])
        if attributes[:attraction] != ""
            attraction = Attraction.find_or_create_by(name: attributes[:attraction])
        else 
            attraction = Attraction.find_by(id: attributes[:attraction])
        end 
            attraction.states << state if state != "" && attraction != ""
            attraction.save if state != ""
            self.state_id = state.id 
        end 
    end 
end 
