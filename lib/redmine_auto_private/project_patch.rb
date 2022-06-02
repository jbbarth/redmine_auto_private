require_dependency 'project'

class Project
  include Redmine::SafeAttributes

  safe_attributes 'force_private_issues'
end
module PluginAutoPrivate
  module ProjectPatch
    def copy(project, options={})
      super
      project = project.is_a?(Project) ? project : Project.find(project)
      self.force_private_issues = project.force_private_issues
      save
    end
  end
end

Project.prepend PluginAutoPrivate::ProjectPatch