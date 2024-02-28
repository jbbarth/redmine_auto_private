require_dependency 'project'

module RedmineAutoPrivate
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        safe_attributes 'force_private_issues'
      end
    end
  end
end
Project.send :include, RedmineAutoPrivate::ProjectPatch
