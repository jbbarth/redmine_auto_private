require 'spec_helper'
require 'redmine_auto_private/project_patch'

describe "ProjectPatch" do
  fixtures :projects
  
  it "should Project#force_private_issues" do
    project = Project.find(1)
    project.safe_attributes=({ "force_private_issues" => 1 })
    assert project.force_private_issues
    project.safe_attributes=({ "force_private_issues" => 0 })
    assert !project.force_private_issues
  end
end
