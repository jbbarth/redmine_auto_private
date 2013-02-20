class AddForcePrivateIssuesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :force_private_issues, :boolean, :default => false
  end
end
