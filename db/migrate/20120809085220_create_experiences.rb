class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.date :date_start
      t.date :date_end
      t.text :description
      t.integer :position_id
      t.integer :company_id
      t.integer :resume_id

      t.timestamps
    end
  end
end
