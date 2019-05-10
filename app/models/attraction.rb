class Attraction < ApplicationRecord
   
    belongs_to :user
    belongs_to :state

    def state_attributes=(attributes)
        state = State.find_or_create_by(attributes)
        self.state = state if state.valid? || !self.state 
    end
end
