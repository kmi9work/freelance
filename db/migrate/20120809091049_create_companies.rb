class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :site
      t.integer :area_id
      t.integer :city_id
      t.integer :country_id

      t.timestamps
    end
  end
end
