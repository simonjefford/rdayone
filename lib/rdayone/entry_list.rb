require 'plist'

module Rdayone
  class EntryList
    def initialize(entry_paths)
      @entry_paths = entry_paths
    end

    def [](index)
      throw ArgumentError if index > @entry_paths.length
      @entry_paths[index]
    end
  end
end
