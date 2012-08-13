class Comment < ActiveRecord::Base
  attr_accessible :camrade_id, :content, :project_id
  belongs_to :camrade
  belongs_to :project
end
