module Gensee
  module Configurable
    attr_accessor :endpoint, :login, :password

    class << self
      USER_AGENT   = "Gensee Ruby Gem #{Gensee::VERSION}".freeze
      # List all keys
      # @return [Array]
      def keys
        @keys ||= [:endpoint, :login, :password]
      end

      def default_options
        {
          endpoint: ENV['GENSEE_ENDPOINT'],
          login: ENV['GENSEE_LOGIN'],
          password: ENV['GENSEE_PASSWORD']
        }
      end

      def user_agent
        ENV['GENSEE_USER_AGENT'] || USER_AGENT
      end
    end

    def options
      ary = Gensee::Configurable.keys.map do |key|
        [key, send(key) || Gensee::Configurable.default_options[key]]
      end
      Hash[ary]
    end

    # Set configuration options using a block
    def configure
      yield self
    end
  end
end
