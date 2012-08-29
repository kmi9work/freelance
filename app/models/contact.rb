class Contact < ActiveRecord::Base
  attr_accessible :camrade_id, :name, :value, :contact_type_id
  belongs_to :camrade
  belongs_to :contact_type
end
