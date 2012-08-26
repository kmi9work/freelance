class City < ActiveRecord::Base
  attr_accessible :name
  belongs_to :country
  belongs_to :region
end
