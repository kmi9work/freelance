class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :min_experience
      t.integer :camrade_count
      t.integer :reserve_count
      t.datetime :datetime_start
      t.datetime :datetime_end
      t.boolean :completed
      t.integer :country_id
      t.integer :city_id
      t.integer :camrade_id

      t.timestamps
    end
  end
end
