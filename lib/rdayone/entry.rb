module Rdayone
  class Entry
    attr_reader :identifier

    def initialize(identifier, plist_hash = {})
      @identifier = identifier
    end
  end
end
