module RedmineAutoPrivate
  class Hooks < Redmine::Hook::ViewListener

    def controller_issues_new_before_save(context={})
      issue = context[:issue]

      if ((issue.author_id == User.current.id) &&
         (!((User.current.allowed_to?(:set_own_issues_private, issue.project)) || User.current.allowed_to?(:set_issues_private, issue.project))) &&
         (issue.project.force_private_issues))

        issue.is_private = true
      end

    end

  end
end
