require 'spec_helper'

describe 'My behaviour' do
  it 'WrataApi#servers_data responded' do
    expect(WrataApi::WrataApi.new.servers_data).to be_a(Hash)
  end

  it 'WrataApi#clear_tests_list responded' do
    expect(WrataApi::WrataApi.new.clear_tests_list).to be_a(Hash)
  end
end
