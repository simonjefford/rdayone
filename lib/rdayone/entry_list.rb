require 'plist'

module Rdayone
  class EntryList
    include Enumerable

    def initialize(entry_paths, finder)
      @entry_paths = entry_paths
      @entry_cache = {}
      @finder = finder
    end

    def fetch(index)
      raise ArgumentError if index > @entry_paths.length
      entry = @entry_cache[index]
      unless entry
        uuid = @finder.uuid_from_path(@entry_paths[index])
        photo = @finder.find_photo_for(uuid)
        entry = Rdayone::Entry.new(Plist::parse_xml(@entry_paths[index]), photo)
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
