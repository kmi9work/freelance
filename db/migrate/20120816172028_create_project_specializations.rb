class CreateProjectSpecializations < ActiveRecord::Migration
  def change
    create_table :project_specializations do |t|
      t.integer :project_id
      t.integer :specialization_id

      t.timestamps
    end
  end
end
