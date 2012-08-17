require 'plist'

module Rdayone
  class EntryList
    include Enumerable

    def initialize(entry_paths)
      @entry_paths = entry_paths
      @entry_cache = {}
    end

    def fetch(index)
      raise ArgumentError if index > @entry_paths.length
      entry = @entry_cache[index]
      unless entry
        entry = Rdayone::Entry.new(Plist::parse_xml(@entry_paths[index]))
        @entry_cache[index] = entry
      end
      entry
    end

    alias :[] :fetch

    def each
      (0..@entry_paths.length - 1).each do |index|
        yield self.fetch(index)
      end
    end
  end
end
