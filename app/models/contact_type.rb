class ContactType < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts
end
