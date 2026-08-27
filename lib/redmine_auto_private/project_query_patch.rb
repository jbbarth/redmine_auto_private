require_dependency 'query'
require_dependency 'project_query'

module RedmineAutoPrivate
  module ProjectQueryPatch
    def initialize_available_filters
      super
      add_available_filter("force_private_issues",
                           :type => :list,
                           :values => [[l(:general_text_yes), "1"], [l(:general_text_no), "0"]])
    end
  end
end

ProjectQuery.prepend RedmineAutoPrivate::ProjectQueryPatch

unless ProjectQuery.available_columns.any? { |c| c.name == :force_private_issues }
  ProjectQuery.available_columns << QueryColumn.new(:force_private_issues, :sortable => "#{Project.table_name}.force_private_issues", :groupable => true)
end
