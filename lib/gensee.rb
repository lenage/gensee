require 'gensee/version'
require 'gensee/client'

module Gensee
  class << self
    # @return [Gensee::Client] Gensee API Wrapper client
    def client(uri, username, password)
      @client = Gensee::Client.new(uri, username, password)
      @client
    end
  end
end
