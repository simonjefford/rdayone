require 'spec_helper'

describe Rdayone::Entry do
  context "initialisation" do
    it "can occur with no arguments" do
      entry = Rdayone::Entry.new
    end

    context "with photo" do
      let(:photo) { double("photo") }

      it "can take an optional photo argument" do
        entry = Rdayone::Entry.new({}, photo)
      end

      it "exposes that photo via an attribute" do
        entry = Rdayone::Entry.new({}, photo)
        expect(entry.photo).to eq(photo)
      end
    end
  end

  context "basic parsing" do
    let(:creation_date) { DateTime.new }

    let(:hash) do
      {
        "Creation Date" => creation_date,
        "Entry Text" => "something cool happened today",
        "UUID" => "02B82925942747709E1DF0518A650E1B",
        "Location" => {
          "Latitude" => 51.505845,
          "Longitude" => 0.1308377,
          "Place Name" => "The Mall",
          "Locality" => "London"
        }
      }
    end

    subject do
      Rdayone::Entry.new(hash)
    end

    it "populates the identifier" do
      expect(subject.identifier).to eq("02B82925942747709E1DF0518A650E1B")
    end

    it "populates the entry text" do
      expect(subject.text).to eq("something cool happened today")
    end

    it "populates the creation date" do
      expect(subject.creation_date).to eq(creation_date)
    end

    context "location" do
      it "returns a new location with the contents of the Location hash" do
        Rdayone::Location.should_receive(:new).with(hash["Location"])
        subject.location
      end
    end
  end
end
