class Scope < ActiveRecord::Base
  attr_accessible :name
  has_many :specializations
  has_many :companies
  has_many :resumes
  has_many :project_scopes
  has_many :projects, through: :project_scopes
end
