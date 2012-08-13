class Language < ActiveRecord::Base
  attr_accessible :name
  has_many :language_levels
end
