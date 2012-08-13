class CreateProjectsScopesJoinTable < ActiveRecord::Migration
  def change
    create_table :projects_scopes do |t|
      t.integer :project_id
      t.integer :scope_id
    end
  end
end
