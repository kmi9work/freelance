class Message < ActiveRecord::Base
  attr_accessible :content, :from_id, :to_id, :unread, :parent_id
  
  belongs_to :from, :class_name => "Camrade", :foreign_key => "from_id"
  belongs_to :camrade, :class_name => "Camrade", :foreign_key => "to_id"
  has_one :answer, :class_name => "Message", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Message", :foreign_key => "parent_id"
end
