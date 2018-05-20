require "mores_marvel/version"
require_relative 'mores_marvel/client'

module MoresMarvel
  class << self
    def new config
      @client ||= MoresMarvel::Client.new config
    end
  end
end
