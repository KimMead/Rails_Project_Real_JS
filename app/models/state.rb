class State < ApplicationRecord
    has_many :attractions
    has_many :users, through: :attractions

    has_many :comments 
    has_many :users, through: :comments 
   
end
