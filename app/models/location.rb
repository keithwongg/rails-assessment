class Location < ApplicationRecord
    belongs_to :hotel

    validates :postal_code, format: { with: /\d{6}/, message: 'must be a 6 digit postal code' }
    auto_strip_attributes :address, squish: true
    auto_strip_attributes :postal_code, squish: true
    auto_strip_attributes :country, squish: true

    def set_address_and_country_if_empty(address, country)
        set_address_if_empty(address)
        set_country_if_empty(country)
        self.save
    end

    def set_lat_long_postal_address_if_empty(lat, long, postal, address)
        set_lat_if_empty(lat)
        set_long_if_empty(long)
        set_postal_if_empty(postal)
        set_address_if_empty(address)
        self.save
    end

    def set_address_if_empty address
        if self.address.blank?
            self.address = address.titleize
        end
    end
    
    def set_country_if_empty country
        if self.country.blank?
            self.country = country.titleize
        end
    end

    def set_lat_if_empty lat
        if self.lat.blank?
            self.lat = lat
        end
    end

    def set_long_if_empty long
        if self.long.blank?
            self.long = long
        end
    end

    def set_postal_if_empty postal_code
        if self.postal_code.blank?
            self.postal_code = postal_code
        end
    end

end
