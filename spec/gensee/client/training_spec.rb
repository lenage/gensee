require 'spec_helper'

describe Gensee::Client::Training do
  let(:auth) { ENV['GENSEE'].split(':') }
  let(:client) { Gensee.client('http://liulishuo.gensee.com', auth.first, auth.last) }

  context 'classroom' do
    let(:classroom) { client.create_classroom("[TEST] a funny topic #{rand(100)}", Time.now, rand(100_000..200_000).to_s, rand(100_000..200_000).to_s) }

    after(:each) do
      expect(client.delete_classroom(classroom[:id])[:code]).to eq '0'
    end

    it 'create' do
      expect(classroom).to be_kind_of Hash
      expect(classroom[:code]).to eq '0'
    end

    it 'modify and delete' do
      new_subject = '[Test] NEW classroom subject'
      t = Time.now + 600 * 60
      room = client.modify_classroom(classroom[:id], new_subject, t, classroom[:teacher_token], classroom[:assistant_token])
      expect(room[:code]).to eq '0'
    end

    it 'query and delete' do
      info = client.classroom_info(classroom[:id])
      expect(info[:id]).to eq info[:id]
    end
  end
end
