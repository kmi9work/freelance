class Specialization < ActiveRecord::Base
  attr_accessible :name, :scope_id
  has_and_belongs_to_many :resumes
  has_and_belongs_to_many :projects
  belongs_to :scope
end
