class Attraction < ApplicationRecord
    belongs_to :state 
    has_many :trips
    has_many :users, through: :trips  
    validates :name, presence: true, uniqueness: true

    def attraction_and_state 
        "#{self.name}, #{state.name}"
    end 
end 
