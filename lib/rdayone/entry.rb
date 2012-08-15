module Rdayone
  class Entry
    attr_reader :identifier

    def initialize(identifier, plist_hash = {})
      @identifier = identifier
      @plist_hash = plist_hash
    end

    def text
      @plist_hash["Entry Text"]
    end

    def creation_date
      @plist_hash["Creation Date"]
    end
  end
end
