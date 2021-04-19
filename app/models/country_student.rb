class CountryStudent < ApplicationRecord
   
    belongs_to :country
    belongs_to :student
end