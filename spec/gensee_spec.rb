require 'spec_helper'

describe Gensee do
  let(:uri) { 'http://example.gensee.com' }
  let(:uri_without_schema) { 'example.gensee.com' }

  context '.client' do

    it 'should accept as uri without schema' do
      @client = Gensee.client(uri_without_schema, 'hello', 'word')
      expect(@client.app_client.build_url.to_s).to match %r{http://}
    end

    it 'create an Gensee::Client' do
      expect(Gensee.client(uri, 'hello', 'word')).to be_kind_of Gensee::Client
    end
  end
end
