require 'plist'

module Rdayone
  class EntryList
    def initialize(entry_paths)
      @entry_paths = entry_paths
    end

    def [](index)
      if index > @entry_paths.length
        throw ArgumentError
      end
      @entry_paths[index]
    end
  end
end
