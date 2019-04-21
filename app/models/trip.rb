class Trip < ApplicationRecord
    belongs_to :user 
    has_many :attractions
    validates :attraction, presence: true 
end
