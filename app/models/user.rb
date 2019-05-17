class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :ratings
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    
end
