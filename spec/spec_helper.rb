require_relative '../lib/rdayone'
require 'rspec'

def entry_fixture_paths
  Dir['spec/fixtures/entries/*']
end

def photo_fixture_path_for_uuid(uuid)
  File.expand_path("spec/fixtures/photos/#{uuid}.jpg")
end
