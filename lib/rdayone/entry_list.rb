require 'plist'

module Rdayone
  class EntryList
    def initialize(entry_paths)
      @entry_paths = entry_paths
    end

    def fetch(index)
      raise ArgumentError if index > @entry_paths.length
      Rdayone::Entry.new(Plist::parse_xml(@entry_paths[index]))
    end

    alias :[] :fetch
  end
end
