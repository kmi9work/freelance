class CreateProjectsSpecializationsJoinTable < ActiveRecord::Migration
  def change
    create_table :projects_specializations do |t|
      t.integer :project_id
      t.integer :specialization_id
    end
  end
end
