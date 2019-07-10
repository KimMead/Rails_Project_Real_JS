class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    
      def self.create_by_github_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
    
        end
      end
    
end
