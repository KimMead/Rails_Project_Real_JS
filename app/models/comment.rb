class Comment < ApplicationRecord
    belongs_to :state 
    belongs_to :user 

    def self.most_comments 
        most(:comment)
    end 
end
