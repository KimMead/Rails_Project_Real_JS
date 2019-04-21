class User < ApplicationRecord
    has_many :trips 
    has_many :attractions, through: :trips 
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 
end
