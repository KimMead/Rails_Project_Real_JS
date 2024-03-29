class State < ApplicationRecord
    has_many :attractions
    has_many :users, through: :attractions

    has_many :comments 
    has_many :users, through: :comments 

    scope :most_comments, -> { joins(:comments).group('comments.state_id').order("count(comments.state_id) desc").limit(1)}
    
end
