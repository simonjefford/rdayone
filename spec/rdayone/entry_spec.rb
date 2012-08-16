require 'spec_helper'

describe Rdayone::Entry do
  context "initialisation" do
    it "can occur with no arguments" do
      entry = Rdayone::Entry.new
    end
  end

  context "basic parsing" do
    let(:creation_date) { DateTime.new }

    subject do
      hash = { "Creation Date" => creation_date, "Entry Text" => "something cool happened today" }
      Rdayone::Entry.new(hash)
    end

    it "populates the entry text" do
      expect(subject.text).to eq("something cool happened today")
    end

    it "populates the creation date" do
      expect(subject.creation_date).to eq(creation_date)
    end
  end
end
