require 'spec_helper'

describe Gensee::Configurable do
  let(:uri) { 'http://www.example.com' }
  let(:login) { 'username' }
  let(:password) { 'password' }

  it '.configure' do
    Gensee.configure do |c|
      c.endpoint = uri
      c.login = login
      c.password = password
    end
    expect(Gensee.options).to be_kind_of Hash
  end
end
