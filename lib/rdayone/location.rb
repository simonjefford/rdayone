module Rdayone
  class Location
    attr_reader :plist_hash, :attribute_mappings

    include Rdayone::AttributeMappable

    def initialize(plist_hash)
      @plist_hash = plist_hash
      @attribute_mappings = {
        :latitude => "Latitude",
        :longitude => "Longitude",
        :place_name => "Place Name",
        :locality => "Locality"
      }
    end
  end
end
