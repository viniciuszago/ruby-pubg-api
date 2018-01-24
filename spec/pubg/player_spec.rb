require "spec_helper"

RSpec.describe Pubg::Player do

  subject { Pubg::Player }

  let!(:player_name) { "shroud" }

  let!(:player_object) {
    open("spec/fixtures/player/player_data.json").read
  }

  let!(:filters) {
    {
      mode: "solo",
      region: "na",
      season: "2018-01"
    }
  }

  describe "#find()" do
    before do
      stub_request(:get, "http://api.pubgtracker.com/v2/profile/pc/#{player_name}?#{URI.encode_www_form(filters)}").
         with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host'=>'api.pubgtracker.com',
          'Trn-Api-Key'=>'api_key',
          'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: player_object, headers: {})
    end

    context "given a valid player name" do
      it "should return player profile data" do
        profile = subject.find(player_name,  filters)

        expect(profile[:accountId]).to eq("account.d50fdc18fcad49c691d38466bed6f8fd")
        expect(profile[:nickname]).to  eq(player_name)
        expect(profile[:stats]).not_to be_empty
      end
    end
  end
end
