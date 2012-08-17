require 'spec_helper'

describe Rdayone::Finder do
  it "finds all entries in the given directory" do
    result = Rdayone::Finder.find('spec/fixtures')
    expect(result.count).to be > 0
  end
end
