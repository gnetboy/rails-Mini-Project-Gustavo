class Student < ApplicationRecord
    belongs_to :user
    validates :first_name, presence: true, uniqueness: true
    def to_s
        self.first_name + " " + self.last_name
    end
end
