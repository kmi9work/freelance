class Position < ActiveRecord::Base
  attr_accessible :name
  has_many :experiences
end
