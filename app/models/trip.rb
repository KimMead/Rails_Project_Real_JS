class Trip < ApplicationRecord
    belongs_to :user 
    belongs_to :state 
    #accepts_nested_attributes_for :state

end
