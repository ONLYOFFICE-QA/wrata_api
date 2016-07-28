require 'spec_helper'

describe 'My behaviour' do
  it 'should do something' do
    expect(WrataApi::WrataApi.new.servers_data).to be_a(Hash)
  end
end
