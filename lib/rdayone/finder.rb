module Rdayone
  class Finder
    def find_entries(path)
      EntryList.new(Dir["#{path}/entries/*.doentry"])
    end
  end
end
