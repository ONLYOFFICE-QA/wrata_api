require 'spec_helper'

describe 'ServerList' do
  let(:api) { WrataApi::WrataApi.new }

  it 'api.free_servers(5) object' do
    expect(api.free_servers(5)).to be_a(WrataApi::ServerList)
  end

  it 'api.free_servers(5) count' do
    expect(api.free_servers(5).length).to eq(5)
  end
end
