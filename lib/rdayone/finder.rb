module Rdayone
  class Finder
    def self.find(path)
      EntryList.new(Dir["#{path}/entries/*.doentry"])
    end
  end
end
