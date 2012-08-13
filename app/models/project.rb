class Project < ActiveRecord::Base
  attr_accessible :city_id, :completed, :camrade_count, :camrade_id, :country_id, :datetime_end, :datetime_start, :description, :min_experience, :reserve_count, :title
  belongs_to :camrade
  has_many :requests
  has_many :comments
  belongs_to :city
  belongs_to :country
  has_and_belongs_to_many :specializations
  has_and_belongs_to_many :scopes
end
