class Comment < ApplicationRecord
    belongs_to :state 
    belongs_to :user 

    def self.most_comments
        joins(:comments).group(:id).order('count(comments.id) DESC').first
      end

end
