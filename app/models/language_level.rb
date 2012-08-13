class LanguageLevel < ActiveRecord::Base
  attr_accessible :language_id, :level
  belongs_to :language
end
