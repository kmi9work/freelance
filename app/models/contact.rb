class Contact < ActiveRecord::Base
  attr_accessible :camrade_id, :name, :value
  belongs_to :camrade
end
