class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :value
      t.integer :contact_type_id
      t.integer :camrade_id

      t.timestamps
    end
  end
end
