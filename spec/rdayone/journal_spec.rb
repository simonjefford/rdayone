require 'spec_helper'

describe Rdayone::Journal do
  describe "loading" do
    let(:finder) do
      f = double("finder")
      f.stub(:find_entries) { [double("entry")] }
      f
    end

    subject { Rdayone::Journal.new("some_path", finder) }

    it "takes a file path" do
      expect(subject.file_path).to eq("some_path")
    end

    it "populates an entries list" do
      expect(subject.entries.count).to eq(1)
    end

    it "uses an entry finder" do
      finder.should_receive(:find_entries).with("some_path")
      subject
    end
  end

  describe "finder interaction" do
    it "should default to the provided finder" do
      journal = Rdayone::Journal.new("some_path")
      expect(journal.finder).to eq(Rdayone::Finder)
    end
  end
end
