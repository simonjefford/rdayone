require 'spec_helper'

describe Rdayone::Entry do
  context "initialisation" do
    it "takes a Day One entry identifier and returns an entry with that identifier" do
      entry = Rdayone::Entry.new("abcde")
      expect(entry.identifier).to eq("abcde")
    end

    it "takes an optional hash" do
      entry = Rdayone::Entry.new("abcde", {})
      expect(entry.identifier).to eq("abcde")
    end
  end
end
