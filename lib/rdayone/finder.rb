module Rdayone
  class Finder
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def find_entries
      EntryList.new(Dir["#{@path}/entries/*.doentry"])
    end

    def find_photo_for(uuid)
      Dir["#{@path}/photos/#{uuid}.jpg"].map { |f| File.expand_path(f) }[0]
    end
  end
end
