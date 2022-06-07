require "spec_helper"

describe ProjectsController, :type => :controller do
  fixtures  :users, :projects

  before do
    @request.session[:user_id] = 1
  end

  describe "copy a project" do
    let(:source_project) { Project.find(2) }
    it "Copy the option force_private_issues" do
      source_project.force_private_issues = true
      source_project.save

      post :copy, :params => {
        :id => source_project.id,
        :project => {
        :name => 'test project',
        :identifier => 'test-project'
        }
      }

      new_pro = Project.last
      expect(new_pro.force_private_issues).to eq(true)
    end
  end
end