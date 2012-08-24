require 'plist'

module Rdayone
  class Cache
    def initialize
      @cache_table = {}
    end

    def fetch(key)
      return @cache_table[key] if @cache_table[key]
      @cache_table[key] = yield
    end
  end

  class EntryList
    include Enumerable

    def initialize(entry_paths, finder)
      @entry_paths = entry_paths
      @entry_cache = {}
      @finder = finder
      @cache = Cache.new
    end

    def fetch(index)
      raise ArgumentError if index > @entry_paths.length

      @cache.fetch(index) do
        uuid = @finder.uuid_from_path(@entry_paths[index])
        photo = @finder.find_photo_for(uuid)
        Rdayone::Entry.new(Plist::parse_xml(@entry_paths[index]), photo)
      end
    end

    alias :[] :fetch

    def sort_desc
      sort { |e1, e2| e2.creation_date <=> e1.creation_date }
    end

    def each
      (0..@entry_paths.length - 1).each do |index|
        yield self.fetch(index)
      end
    end
  end
end
