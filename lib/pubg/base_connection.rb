require 'net/http'
require 'json'

module Pubg
  class BaseConnection
    PUBG_API_VERSION = "v2".freeze
    BASE_URL         = "https://api.pubgtracker.com/#{PUBG_API_VERSION}/".freeze

    def call(service)
      uri = URI(BASE_URL + service)
      req = Net::HTTP::Get.new(uri)
      req["TRN-Api-Key"] = Pubg.config.trn_api_key

      res = Net::HTTP.start(uri.hostname) {|http|
        http.request(req)
      }

      JSON.parse res.body, symbolize_names: true
    end
  end
end
