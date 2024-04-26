class Hotel < ApplicationRecord
    has_many :hotel_images, dependent: :destroy
    has_one :location, dependent: :destroy
    has_many :hotel_facilities, dependent: :destroy
    has_many :facility, through: :hotel_facilities, dependent: :destroy
    
    # validates :ref_id, :destination_id, presence: true, uniqueness: true

    auto_strip_attributes :name, squish: true
    auto_strip_attributes :description, squish: true

    def update_name_and_description_if_blank(name, description)
        if self.name.blank?
            self.name = name.strip.titleize
        end
        if self.description.blank?
            self.description = StringUtils.sentence_cleaning(description)
        end
        self.save
    end

    def overwrite_name_and_description(name, description)
        self.name = name.strip.titleize
        self.description = StringUtils.sentence_cleaning(description)
        self.save
    end

end
