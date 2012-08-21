module Rdayone
  class Location
    def initialize(plist_hash)
      @plist_hash = plist_hash
      @attribute_mappings = {
        latitude: "Latitude",
        longitude: "Longitude",
        place_name: "Place Name",
        locality: "Locality"
      }
    end

    def method_missing(method, *args)
      key = @attribute_mappings[method]
      if key
        @plist_hash[key]
      else
        super
      end
    end
  end
end
