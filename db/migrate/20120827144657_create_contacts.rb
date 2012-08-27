class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :value
      t.integer :camrade_id

      t.timestamps
    end
  end
end
