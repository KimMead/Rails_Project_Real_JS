class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

end
