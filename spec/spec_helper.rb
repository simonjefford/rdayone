require_relative '../lib/rdayone'
require 'rspec'

def entry_fixture_paths
  Dir['spec/fixtures/entries/*']
end

def photo_fixture_paths
  Dir['spec/fixtures/photos/*']
end
