class CreateResumesSpecializationsJoinTable < ActiveRecord::Migration
  def change
    create_table :resumes_specializations do |t|
      t.integer :resume_id
      t.integer :specialization_id
    end
  end
end
