class State < ApplicationRecord
    has_many :attractions 
    has_many :users, through: :attractions 
    validates :name, presence: true 
end
