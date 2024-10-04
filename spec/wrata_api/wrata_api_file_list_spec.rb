# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#file_list' do
  let(:api) { described_class.new }

  before do
    stub_request(:get, "#{api.uri}/runner/file_tree")
      .to_return(body: '["path/file1.rb", "path2/file2.rb"]')
  end

  it 'file_tree return array' do
    expect(api.file_list(project)).to be_a(Array)
  end
end
