require 'spec_helper'

describe Gensee do
  let(:uri) { 'http://example.gensee.com' }
  let(:uri_without_schema) { 'example.gensee.com' }

  context '.client' do

    before(:all) do
      Gensee.configure do |c|
        c.endpoint = 'http://example.gensee.com'
        c.login = 'hello'
        c.password = 'hello'
      end
    end

    it 'should accept as uri without schema' do
      @client = Gensee.client
      expect(@client.app_client.build_url.to_s).to match %r{http://}
    end

    it 'create an Gensee::Client' do
      expect(Gensee.client).to be_kind_of Gensee::Client
    end
  end
end
