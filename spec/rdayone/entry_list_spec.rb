require 'spec_helper'

describe Rdayone::EntryList do
  let(:finder) { double("finder").as_null_object }

  subject { Rdayone::EntryList.new(entry_fixture_paths, finder) }

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

    it "uses the finder to pass in the full path to the photo" do
      finder.stub(:uuid_from_path).and_return("uuid")
      finder.should_receive(:find_photo_for).with("uuid")
      expect(subject[0].photo).to_not be_nil
    end
  end

  context "enumerating" do
    it "implements each" do
      entries = []
      subject.each { |e| entries << e }
      expect(entries.count).to eq(2)
    end

    it "is Enumerable" do
      mapresult = subject.map { |e| e.text }
      expect(mapresult[0]).to eq("Something cool happened in London")
    end
  end

  context "caching" do
    it "should cache entries for subsequent requests" do
      list = subject.to_a
      Plist.stub(:parse_xml).and_raise("Entry was not cached")
      subject[0]
    end
  end
end
