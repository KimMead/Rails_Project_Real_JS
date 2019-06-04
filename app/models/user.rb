class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
          user.email = auth.info.email
          user.uid = auth.uid
          user.provider = auth.provider
          user.avatar_url = auth.info.image
          user.username = auth.info.name
          user.oauth_token = auth.credentials.token
          user.save!
        end
    end 
end
