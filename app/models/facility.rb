class Facility < ApplicationRecord
    has_many :hotel_facilities
    has_many :hotel, through: :hotel_facilities

    # validates :name, presence: true, uniqueness: true
    auto_strip_attributes :name, squish: true
end
