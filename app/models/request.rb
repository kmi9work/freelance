class Request < ActiveRecord::Base
  attr_accessible :camrade_id, :member, :message, :project_id, :reserve
  belongs_to :camrade
  belongs_to :project
end
