require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../../lib/redmine_auto_private/project_patch'

class ProjectPatchTest < ActiveSupport::TestCase
  fixtures :projects
  
  test "Project#force_private_issues" do
    project = Project.find(1)
    project.safe_attributes=({ "force_private_issues" => 1 })
    assert project.force_private_issues
    project.safe_attributes=({ "force_private_issues" => 0 })
    assert !project.force_private_issues
  end
end
