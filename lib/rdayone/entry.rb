module Rdayone
  class Entry
    attr_reader :identifier

    def initialize(identifier, plist_hash = {})
      @identifier = identifier
      @plist_hash = plist_hash
      @attribute_mappings = {
        text: "Entry Text",
        creation_date: "Creation Date"
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
