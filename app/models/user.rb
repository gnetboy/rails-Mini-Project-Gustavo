class User < ApplicationRecord
       has_many :students
       has_many :country_users 
       has_many :countries, through: :country_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
