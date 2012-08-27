class ProjectArea < ActiveRecord::Base
  attr_accessible :project_id, :area_id
  validates :project, :area, presence: true
  belongs_to :project
  belongs_to :area
end
