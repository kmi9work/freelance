class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :from_id
      t.integer :to_id
      t.boolean :unread, default: true
      t.integer :parent_id
      
      t.timestamps
    end
  end
end
