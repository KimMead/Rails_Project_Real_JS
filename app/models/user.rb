class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    scope :most_trips, -> { joins(:attractions).group('attractions.user_id').order("count(attractions.user_id) desc").limit(1)}
end
