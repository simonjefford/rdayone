require 'spec_helper'

describe Rdayone::Location do
  let(:hash) do
    {
      "Latitude" => 51.505845,
      "Longitude" => 0.1308377,
      "Place Name" => "The Mall",
      "Locality" => "London"
    }
  end

  subject { Rdayone::Location.new(hash) }

  it "populates the basic attributes" do
    expect(subject.latitude).to eq(51.505845)
    expect(subject.longitude).to eq(0.1308377)
    expect(subject.place_name).to eq("The Mall")
    expect(subject.locality).to eq("London")
  end
end
