module Pubg
  class Player
    def self.find(player_name, filters = {})
      filters = URI.encode_www_form(filters)

      Pubg::BaseConnection.new.call("profile/pc/#{player_name}?#{filters}")
    end
  end
end
