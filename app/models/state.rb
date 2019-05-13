class State < ApplicationRecord
    has_many :attractions
    has_many :users, through: :attractions

   
end
