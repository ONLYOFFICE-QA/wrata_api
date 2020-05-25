module WrataApi
  # Methods to work with file tree
  module FileTreeMethods
    def file_tree(project, ref = 'master')
      uri = URI.parse("#{@uri}/runner/file_tree")
      body = {
          'project' => project,
          'ref' => ref
      }
      perform_get(uri, body)
    end
  end
end