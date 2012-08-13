class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :message
      t.boolean :member
      t.boolean :reserve
      t.integer :camrade_id
      t.integer :project_id

      t.timestamps
    end
  end
end
