class Service < ActiveRecord::Base
  attr_accessible :camrade_id, :description, :scope_id, :title
  belongs_to :scope
  belongs_to :camrade
end
