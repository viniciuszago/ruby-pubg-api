module Pubg
  def self.configure
    yield @config ||= Pubg::Config.new
  end

  def self.config
    @config
  end
end

require 'pubg/config'

require 'pubg/base_connection'
require 'pubg/player'
require 'pubg/matches'
require 'pubg/version'
