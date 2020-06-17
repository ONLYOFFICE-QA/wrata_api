# frozen_string_literal: true

module WrataApi
  # Methods to work with file tree
  module FileListMethods
    # Return list of files in specific project
    # @param project [String] name of project
    # @param ref [String] branch or hash of commit to get list of files
    # @return [Array<String>] list of files
    def file_list(project, ref = 'master')
      uri = URI.parse("#{@uri}/runner/file_tree")
      body = {
        'flatten' => true,
        'project' => project,
        'refs' => ref
      }
      perform_get(uri, body)
    end
  end
end
