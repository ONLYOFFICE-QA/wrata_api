# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi do
  test_file = '/home/lobashov-2/RubymineProjects/'\
              'OnlineDocuments/spec/studio/run_test_single_spec.rb'
  let(:api) { described_class.new }

  it 'WrataApi#add_to_queue' do
    expect(api.add_to_queue(test_file)).to be_a(Hash)
  end

  it 'WrataApi#add_tests_to_queue' do
    expect(api.add_tests_to_queue([test_file])).to be_a(Array)
  end

  it 'WrataApi#tests_in_queue is list' do
    api.add_to_queue(test_file)
    expect(api.tests_in_queue).not_to be_empty
  end

  it 'WrataApi#test_in_queue default values are correct' do
    api.clear_tests_list
    api.add_to_queue(test_file)
    expect(api.tests_in_queue.first['spec_browser']).to eq('default')
  end

  it 'WrataApi#clear_tests_list responded' do
    expect(api.clear_tests_list).to be_a(Hash)
  end
end
