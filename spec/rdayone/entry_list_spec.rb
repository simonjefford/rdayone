require 'spec_helper'

describe Rdayone::EntryList do
  subject { Rdayone::EntryList.new(entry_fixture_paths) }

  context "entry fetching" do
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

  context "enumerating" do
    it "implements each" do
      entries = []
      subject.each { |e| entries << e }
      expect(entries.count).to eq(1)
    end

    it "is Enumerable" do
      mapresult = subject.map { |e| e.text }
      expect(mapresult).to eq(["Something cool happened in London"])
    end
  end
end
