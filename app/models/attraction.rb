class Attraction < ApplicationRecord
    belongs_to :user 
    belongs_to :state 
    validates :name, presence: true

    def attraction_and_state 
        "#{self.name}, #{state.name}"
    end 
end 
