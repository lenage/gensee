require 'faraday'
require 'digest'
require 'oj'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'
require 'gensee/client/training'
require 'gensee/configurable'

module Gensee
  # Client for Gensee API
  #
  # @see http://www.gensee.com/document-technical.php
  # @params: uri [String], the URI/endpoint which Gensee created for you
  #          username [String], Your Gensee login in name. might be an email address
  #          password [String], Your Gensee password
  class Client
    include Gensee::Client::Training

    def initialize(options = {})
      opts = options.dup
      @endpoint = opts[:endpoint].start_with?('http://') ? opts[:endpoint] : "http://#{opts[:endpoint]}"
      @username = opts[:login]
      @password = Digest::MD5.hexdigest(opts[:password])
    end

    def default_options
      { loginName: @username, password: @password, sec: 'true' }
    end

    def app_client
      @client ||= Faraday.new(@endpoint) do |conn|
        conn.params = default_options
        conn.headers = {
          content_type: 'application/json',
          user_agent: Gensee::Configurable.user_agent
        }
        conn.request :url_encoded
        # conn.response :logger
        conn.adapter Faraday.default_adapter
      end
    end

    private

    def request(method, path, params)
      resp = app_client.send(method, path, params)
      convert_result(resp)
    end

    %w(get post).each do |m|
      define_method m do |path, params|
        request(m, path, params)
      end
    end

    ## Helper methods
    def preform_path(path)
      "/integration/site/#{path}"
    end

    def time_to_ms(time)
      (time.to_f * 1000).to_i
    end

    def convert_result(resp)
      if resp.success?
        h = Oj.load(resp.body)
        ary = h.inject([]) { |r, (k, v)| r << [k.to_s.underscore, v] }
        Hash[ary].with_indifferent_access
      else
        resp
      end
    end
  end
end
