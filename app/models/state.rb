class State < ApplicationRecord
    has_many :attractions
    has_many :users, through: :attractions

    has_many :comments 
    has_many :users, through: :comments 
    
    def self.most_comments
        joins(:comments).group(:id).order('COUNT(comments.id) DESC')
    end
end
