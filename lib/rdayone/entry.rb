module Rdayone
  class Entry
    attr_reader :photo, :plist_hash, :attribute_mappings

    include Rdayone::AttributeMappable

    def initialize(plist_hash = {}, photo = nil)
      @plist_hash = plist_hash
      @photo = photo
      @attribute_mappings = {
        :text => "Entry Text",
        :creation_date => "Creation Date",
        :identifier => "UUID"
      }
    end

    def <=>(other)
      self.creation_date <=> other.creation_date
    end

    def location
      Location.new(@plist_hash["Location"])
    end
  end
end
