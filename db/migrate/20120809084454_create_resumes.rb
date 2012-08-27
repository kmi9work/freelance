class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.text :description
      t.string :title
      t.integer :camrade_id
      t.integer :area_id
      
      t.timestamps
    end
  end
end
