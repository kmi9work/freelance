class Resume < ActiveRecord::Base
  attr_accessible :camrade_id, :description, :title, :experiences_attributes, :specialization_names, :scope_id, :specialization_ids
  
  belongs_to :camrade
  has_many :language_levels, uniq: true
  has_many :experiences, uniq: true
  belongs_to :scope
  has_and_belongs_to_many :specializations, uniq: true
  accepts_nested_attributes_for :language_levels, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  accepts_nested_attributes_for :experiences, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  accepts_nested_attributes_for :scope
  
  def specialization_names
    # specializations.map{|s| s.try(:name)}.join(", ")
  end
  def specialization_names= str
    if str.present?
      specializations = str.split(",").map(&:strip)
      specializations.each do |s|
        self.specializations << Specialization.find_or_create_by_name(s) 
      end
    end
  end
  def specialization_ids= ids
    specs = []
    ids.each do |id|
      specs << Specialization.find(id) unless id.blank?
    end
    puts "======================="
    p specs
    self.specializations = specs.uniq
  end
  
  def specialization_ids
    self.specializations.map(&:id)
  end
end
