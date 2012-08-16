class Project < ActiveRecord::Base
  attr_accessible :city_id, :completed, :camrade_count, :camrade_id, :country_id, :datetime_end, :datetime_start, :description, :min_experience, :reserve_count, :title, :projects_scopes_attributes
  belongs_to :camrade
  has_many :requests
  has_many :comments
  belongs_to :city
  belongs_to :country
  has_many :project_specializations
  has_many :specializations, through: :project_specializations
  has_many :project_scopes
  has_many :scopes, through: :project_scopes
  accepts_nested_attributes_for :project_scopes, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
end
