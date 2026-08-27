require 'spec_helper'

describe ProjectQuery do
  fixtures :projects

  def find_projects_with_query(query)
    Project.where(query.statement).to_a
  end

  describe "force_private_issues column and filter availability" do
    it "exposes the force_private_issues filter with yes/no values" do
      filter = ProjectQuery.new(:name => "_").available_filters["force_private_issues"]
      refute_nil filter
      expect(filter[:type]).to eq :list
      expect(filter[:values].map(&:last)).to match_array(["1", "0"])
    end

    it "exposes the force_private_issues column with its caption" do
      column = ProjectQuery.new(:name => "_").available_columns.detect { |c| c.name == :force_private_issues }
      refute_nil column
      expect(column.groupable?).to be true
      expect(column.sortable).to eq "#{Project.table_name}.force_private_issues"
    end
  end

  describe "filtering on force_private_issues" do
    before do
      Project.find(3).update_column(:force_private_issues, true)
    end

    it "includes only projects forcing private issues (operator = yes)" do
      query = ProjectQuery.new(:name => "_",
                               :filters => { "force_private_issues" => { :operator => "=", :values => ["1"] } })
      ids = find_projects_with_query(query).map(&:id)
      expect(ids).to include(3)
      expect(ids).not_to include(1, 2)
    end

    it "excludes projects forcing private issues (operator = no)" do
      query = ProjectQuery.new(:name => "_",
                               :filters => { "force_private_issues" => { :operator => "=", :values => ["0"] } })
      ids = find_projects_with_query(query).map(&:id)
      expect(ids).not_to include(3)
      expect(ids).to include(1, 2)
    end
  end
end
