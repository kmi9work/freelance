class ProjectScope < ActiveRecord::Base
  attr_accessible :project_id, :scope_id
  validates :project, :scope, presence: true
  belongs_to :project
  belongs_to :scope
end
