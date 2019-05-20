class State < ApplicationRecord
    has_many :attractions
    has_many :users, through: :attractions

    has_many :comments 
    has_many :users, through: :comments 
    
    def self.comment_count
        count(:comment)
    end
end
