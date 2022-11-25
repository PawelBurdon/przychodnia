class Clinic < ApplicationRecord
    has_many :visits
    belongs_to :doctor
    belongs_to :user, optional: true
    
    validates :number, presence: true

    has_one_attached :image
end