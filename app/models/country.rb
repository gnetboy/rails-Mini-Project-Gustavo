class Country < ApplicationRecord
    belongs_to :user 
    has_many :country_students
    has_many :students, through: :country_students 

end