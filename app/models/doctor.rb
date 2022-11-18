class Doctor < ApplicationRecord
has_many :clinics

    validates :name, presence: true
    
end
