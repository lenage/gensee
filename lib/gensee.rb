require 'gensee/version'
require 'gensee/client'

module Gensee

  class << self
    include Gensee::Configurable

    # @return [Gensee::Client] Gensee API Wrapper client
    def client
      @client = Gensee::Client.new(options)
      @client
    end
  end
end
