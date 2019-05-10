class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :state 
    
    def state_attributes=(attributes)
        self.state = state if state.valid? || !self.vet 
    end 
end
