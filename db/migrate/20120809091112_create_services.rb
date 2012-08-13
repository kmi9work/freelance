class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.integer :scope_id
      t.integer :camrade_id

      t.timestamps
    end
  end
end
