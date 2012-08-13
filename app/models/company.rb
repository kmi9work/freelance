class Company < ActiveRecord::Base
  attr_accessible :city_id, :country_id, :name, :scope_id, :site
  has_many :experiences
  belongs_to :scope
  belongs_to :city
  belongs_to :country
end
