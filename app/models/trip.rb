class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :state 
    #accepts_nested_attributes_for :state

    def state_attributes=(attributes)
        state = State.find_or_create_by(attributes)
        self.state = state if state.valid? || self.vet 
    end 
end
