module Rdayone
  class Journal
    attr_reader :file_path, :entries, :finder

    def initialize(file_path, finder = Rdayone::Finder.new(file_path))
      @file_path = file_path
      @finder = finder
      @entries = finder.find_entries
    end
  end
end
