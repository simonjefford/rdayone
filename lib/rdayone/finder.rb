module Rdayone
  class Finder
    def initialize(path)
      @path = path
    end

    def find_entries
      EntryList.new(Dir["#{@path}/entries/*.doentry"])
    end
  end
end
