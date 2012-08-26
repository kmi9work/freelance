class CreateProjectScopes < ActiveRecord::Migration
  def change
    create_table :project_scopes do |t|
      t.integer :project_id, null: false
      t.integer :scope_id, null: false

      t.timestamps
    end
  end
end
