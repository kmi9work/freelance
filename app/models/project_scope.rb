class ProjectScope < ActiveRecord::Base
  attr_accessible :project_id, :scope_id
  belongs_to :project
  belongs_to :scope
end
