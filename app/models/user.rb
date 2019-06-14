class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 


    def self.find_or_create_by_omniauth(auth_hash)
      oauth_email = auth_hash
      self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
        user.password = SecureRandom.hex 
      end 
    end 
end
