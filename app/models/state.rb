class State < ApplicationRecord
    has_many :attractions 
    has_many :trips, through: :attractions 
    validates :name, presence: true 
end
