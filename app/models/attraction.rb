class Attraction < ApplicationRecord
    belongs_to :state 
    has_many :trips 
    has_many :users, through: :trips 
    validates :name, presence: true
    validates :state_id, presence: true 

    def attraction_and_state 
        "#{self.name}, #{state.name}"
    end 

    def state_name=(state_name)
        if state_name[:state] !=""
        state = State.find_by(name: state_name[:state])
        self.state_id = state.id 
        end 
    end
end 
