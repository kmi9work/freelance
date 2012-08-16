class ProjectSpecialization < ActiveRecord::Base
  attr_accessible :project_id, :specialization_id
  belongs_to :project
  belongs_to :specialization
end
