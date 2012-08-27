class CreateProjectAreas < ActiveRecord::Migration
  def change
    create_table :project_areas do |t|
      t.integer :project_id, null: false
      t.integer :area_id, null: false

      t.timestamps
    end
  end
end
