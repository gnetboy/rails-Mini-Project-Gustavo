class Student < ApplicationRecord
    belongs_to :user
    has_many :country_students
    has_many :countries, through: :country_students
    

    def to_s
        self.first_name + " " + self.last_name
    end
end
