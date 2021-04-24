class Student < ApplicationRecord
    belongs_to :user

    def to_s
        self.first_name + " " + self.last_name
    end
end
