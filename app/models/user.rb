class User < ApplicationRecord
has_many :clinics
has_many :doctors
has_many :visits

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
end
