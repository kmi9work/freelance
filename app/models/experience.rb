class Experience < ActiveRecord::Base
  attr_accessible :company_id, :date_end, :date_start, :description, :position_id, :resume_id, :company_name
  belongs_to :resume
  belongs_to :position
  belongs_to :company
  def company_name
    company.try(:name)
  end
  def company_name=(name)
    self.company = Company.find_or_create_by_name(name) if name.present?
  end
end
