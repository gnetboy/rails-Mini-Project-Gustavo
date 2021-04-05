class Student < ApplicationRecord
    has_and_belongs_to_many :courses 

    def to_s
        self.first_name + " " + self.last_name
    end
end
