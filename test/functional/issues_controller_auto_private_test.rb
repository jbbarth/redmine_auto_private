require File.dirname(__FILE__) + '/../test_helper'

class IssuesControllerAutoPrivateTest < ActionController::TestCase
  fixtures :projects, :users, :roles, :members, :member_roles, :issues, :issue_statuses, :versions,
           :trackers, :projects_trackers, :issue_categories, :enabled_modules, :enumerations, :attachments,
           :workflows, :custom_fields, :custom_values, :custom_fields_projects, :custom_fields_trackers,
           :time_entries, :journals, :journal_details, :queries, :repositories, :changesets

  include Redmine::I18n

  setup do
    @controller = IssuesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 1 #permissions are hard
  end

  test "keeps checkbox if auto-private flag not set" do
    Issue.find(1).project.update_attribute(:force_private_issues, false)
    get :show, :id => 1
    assert_response :success
    assert_tag "input", :attributes => {:name => "issue[is_private]", :type => "checkbox"}
  end

  test "set private flag for issues" do
    Issue.find(1).project.update_attribute(:force_private_issues, true)
    get :show, :id => 1
    assert_response :success
    assert_no_tag "input", :attributes => {:name => "issue[is_private]", :type => "checkbox"}
    assert_tag "input", :attributes => {:name => "issue[is_private]", :type => "hidden", :value => "1"}
  end
end
