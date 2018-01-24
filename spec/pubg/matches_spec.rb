require "spec_helper"

RSpec.describe Pubg::Matches do

  subject { Pubg::Matches }

  let!(:account_id) { "account.d50fdc18fcad49c691d38466bed6f8fd" }

   let!(:matches_object) {
    open("spec/fixtures/matches/all_matches.json").read
  }

  describe "#find()" do
    before do
      stub_request(:get, "http://api.pubgtracker.com/v2/matches/pc/#{account_id}").
        with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host'=>'api.pubgtracker.com',
          'Trn-Api-Key'=>'api_key',
          'User-Agent'=>'Ruby'
           }).
        to_return(status: 200, body: matches_object, headers: {})
    end

    context "given a valid account id" do
      it "should return matches data" do
        matches = subject.find(account_id)


        expect(matches).not_to be_empty

        last_match = matches.last

        expect(last_match).to have_key(:id)
        expect(last_match).to have_key(:updated)
        expect(last_match).to have_key(:updatedJS)
        expect(last_match).to have_key(:season)
        expect(last_match).to have_key(:seasonDisplay)
        expect(last_match).to have_key(:match)
        expect(last_match).to have_key(:matchDisplay)
        expect(last_match).to have_key(:region)
        expect(last_match).to have_key(:regionDisplay)
        expect(last_match).to have_key(:rounds)
        expect(last_match).to have_key(:wins)
        expect(last_match).to have_key(:kills)
        expect(last_match).to have_key(:assists)
        expect(last_match).to have_key(:top10)
        expect(last_match).to have_key(:rating)
        expect(last_match).to have_key(:ratingChange)
        expect(last_match).to have_key(:headshots)
        expect(last_match).to have_key(:kd)
        expect(last_match).to have_key(:damage)
        expect(last_match).to have_key(:timeSurvived)
        expect(last_match).to have_key(:winRating)
        expect(last_match).to have_key(:winRatingChange)
        expect(last_match).to have_key(:killRating)
        expect(last_match).to have_key(:killRatingChange)
        expect(last_match).to have_key(:killRatingRankChange)
        expect(last_match).to have_key(:moveDistance)
        expect(last_match).to have_key(:ratingPercentile)
      end
    end
  end
end
