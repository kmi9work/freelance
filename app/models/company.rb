class Company < ActiveRecord::Base
  attr_accessible :city_id, :country_id, :name, :area_id, :site
  has_many :experiences
  belongs_to :area
  belongs_to :city
  belongs_to :country
end
