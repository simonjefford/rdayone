require 'spec_helper'

describe Rdayone::Finder do
  subject { Rdayone::Finder.new('spec/fixtures') }

  it "finds all entries in the given directory" do
    result = subject.find_entries
    expect(result.count).to be > 0
  end

  it "finds the photo corresponding to an entry (if one exists)" do
    photo = subject.find_photo_for("02B82925942747709E1DF0518A650E1B")
    expect(photo).to eq(photo_fixture_path_for_uuid("02B82925942747709E1DF0518A650E1B"))
  end

  it "returns nil if there is no photo" do
    photo = subject.find_photo_for("not_there")
    expect(photo).to be_nil
  end
end
