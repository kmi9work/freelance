class CreateProjectScopes < ActiveRecord::Migration
  def change
    create_table :project_scopes do |t|
      t.integer :project_id
      t.integer :scope_id

      t.timestamps
    end
  end
end
