class CreateProjectSpecializations < ActiveRecord::Migration
  def change
    create_table :project_specializations do |t|
      t.integer :project_id, null: false
      t.integer :specialization_id, null: false

      t.timestamps
    end
  end
end
