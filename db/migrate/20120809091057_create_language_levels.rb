class CreateLanguageLevels < ActiveRecord::Migration
  def change
    create_table :language_levels do |t|
      t.integer :level
      t.integer :language_id

      t.timestamps
    end
  end
end
