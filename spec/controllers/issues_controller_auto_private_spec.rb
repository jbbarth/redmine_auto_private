require 'spec_helper'

describe IssuesController, :type => :controller  do
  render_views
  fixtures :projects, :users, :roles, :members, :member_roles, :issues, :issue_statuses, :versions,
           :trackers, :projects_trackers, :issue_categories, :enabled_modules, :enumerations, :attachments,
           :workflows, :custom_fields, :custom_values, :custom_fields_projects, :custom_fields_trackers,
           :time_entries, :journals, :journal_details, :queries, :repositories, :changesets

  include Redmine::I18n

  before do
    @controller = IssuesController.new
    @request    = ActionDispatch::TestRequest.create
    @response   = ActionDispatch::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 2 #permissions are hard
  end

  it "should keeps checkbox if auto-private flag not set" do
    Issue.find(1).project.update_attribute(:force_private_issues, false)
    get :show, params: {:id => 1}
    expect(response).to be_successful
    assert_select "input[name='issue[is_private]'][type='checkbox']"
  end

  it "should set private flag for issues" do
    Issue.find(1).project.update_attribute(:force_private_issues, true)
    get :show, params: {:id => 1}
    expect(response).to be_successful
    assert_select "input[name='issue[is_private]'][type='checkbox']", false
    assert_select "input[name='issue[is_private]'][type='hidden'][value='1']"
  end
end
