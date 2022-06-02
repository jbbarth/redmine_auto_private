require_dependency 'project'

module RedmineAutoPrivate
  module ProjectPatch
    def self.prepended(base)
      base.class_eval do
        safe_attributes 'force_private_issues'
      end
    end

    def copy(project, options={})
      super
      project = project.is_a?(Project) ? project : Project.find(project)
      self.force_private_issues = project.force_private_issues
      save
    end
  end
end

Project.prepend RedmineAutoPrivate::ProjectPatch
