require 'spec_helper'
# e = EntryList.new('/Users/simon/journal/entries/1.doentry', '2.doentry')
# e[0] is instance of Entry with contents of 1.doentry
#
describe Rdayone::EntryList do
  context "entry fetching" do
    subject { Rdayone::EntryList.new(entry_fixture_paths) }

    it "returns the nth entry when used like an array" do
      e = subject[0]
      expect(e).to_not be_nil
    end

    it "returns a populated Entry" do
      e = subject[0]
      expect(e.text).to eq("Something cool happened in London")
    end

    it "throws an error if the index is out of range" do
      expect { subject[100] }.to raise_error(ArgumentError)
    end
  end
end
