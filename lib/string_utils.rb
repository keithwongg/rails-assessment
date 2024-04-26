class StringUtils
    def self.sentence_cleaning text
        text.strip.split('.').map{|x| x.strip.capitalize}.join('. ')
    end

    def self.map_facilities_name_and_category name
        case name
        when /(bar)/
            ["general", "bar"]
        when /(pool|out)/
            ["general", "outdoor pool"]
        when /(pool|in)/
            ["general", "indoor pool"]
        when /(business)/
            ["general", "business center"]
        when /(child)/
            ["general", "childcare"]
        when /(dry|clean)/
            ["general", "dry cleaning"]
        when /(wifi)/
            ["general", "wifi"]
        when /(parking)/
            ["general", "parking"]
        when /(bar)/
            ["general", "bar"]
        when /(concierge)/
            ["general", "concierge"]
        when /(breakfast)/
            ["general", "breakfast"]
        when /(tv|television)/
            ["room", "tv"]
        when /(coffee|machine)/
            ["room", "coffee machine"]
        when /(iron)/
            ["room", "iron"]
        when /(kettle)/
            ["room", "kettle"]
        when /(air|con)/
            ["room", "air conditioner"]
        when /(hair|dryer)/
            ["room", "hair dryer"]
        when /(tub)/
            ["room", "bathtub"]
        else
            puts "no matching pattern"
            ["unclassified", name]
        end
    end
end