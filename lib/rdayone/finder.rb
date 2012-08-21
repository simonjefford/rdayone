module Rdayone
  class Finder
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def find_entries
      EntryList.new(Dir["#{@path}/entries/*.doentry"])
    end
  end
end
