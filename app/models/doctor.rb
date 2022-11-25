class Doctor < ApplicationRecord
has_many :clinics
belongs_to :user, optional: true

    validates :name, presence: true

end