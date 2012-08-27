class Service < ActiveRecord::Base
  attr_accessible :camrade_id, :description, :area_id, :title
  belongs_to :area
  belongs_to :camrade
end
