require "spec_helper"

RSpec.describe Pubg do
  it "has a version number" do
    expect(Pubg::VERSION).not_to be nil
  end
end
