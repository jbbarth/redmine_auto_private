module RedmineAutoPrivate
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context = {})
      issue = context[:issue]
      issue.is_private = true if issue.project.force_private_issues
    end
  end

  class ModelHook < Redmine::Hook::Listener
    def after_plugins_loaded(_context = {})
      require_relative 'project_patch'
    end
  end
end
