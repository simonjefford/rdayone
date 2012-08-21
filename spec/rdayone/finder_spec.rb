require 'spec_helper'

describe Rdayone::Finder do
  subject { Rdayone::Finder.new }

  it "finds all entries in the given directory" do
    result = subject.find_entries('spec/fixtures')
    expect(result.count).to be > 0
  end
end
