module Rdayone
  class Finder
    def self.find_entries(path)
      EntryList.new(Dir["#{path}/entries/*.doentry"])
    end
  end
end
