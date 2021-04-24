class CountryUser < ApplicationRecord
   
    belongs_to :country
    belongs_to :user 
end