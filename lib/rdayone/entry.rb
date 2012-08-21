module Rdayone
  class Entry
    attr_reader :photo

    def initialize(plist_hash = {}, photo = nil)
      @plist_hash = plist_hash
      @photo = photo
      @attribute_mappings = {
        text: "Entry Text",
        creation_date: "Creation Date",
        identifier: "UUID"
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
