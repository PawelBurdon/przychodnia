class Clinic < ApplicationRecord

    belongs_to :doctor
    validates :number, presence: true

    has_one_attached :image
end
