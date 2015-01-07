module Gensee
  module Configurable
    attr_writer :uri, :username, :password

    class << self
      # List all keys
      # @return [Array]
      def keys
        @keys ||= [:uri, :username, :password]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    private

    def options
      Hash[Gensee::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
