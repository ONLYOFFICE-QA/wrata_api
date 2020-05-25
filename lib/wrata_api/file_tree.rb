# frozen_string_literal: true

module WrataApi
  # Methods to work with file tree
  module FileListMethods
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
