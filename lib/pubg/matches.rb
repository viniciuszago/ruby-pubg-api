module Pubg
  class Matches
    def self.find(account_id)
      Pubg::BaseConnection.new.call("matches/pc/#{account_id}")
    end
  end
end
