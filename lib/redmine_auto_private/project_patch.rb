require_dependency 'project'

class Project
  include Redmine::SafeAttributes

  safe_attributes 'force_private_issues'
end
