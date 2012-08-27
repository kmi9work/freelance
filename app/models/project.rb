class Project < ActiveRecord::Base
  validates :title, presence: true
  
  attr_accessible :city_id, :completed, :camrade_count, :camrade_id, :country_id, :datetime_end, :datetime_start, :description, :min_experience, :reserve_count, :title
  attr_accessible :project_area_ids, :specialization_ids
  belongs_to :camrade
  has_many :requests
  has_many :comments
  belongs_to :city
  belongs_to :country
  has_many :project_specializations, :uniq => true
  has_many :specializations, through: :project_specializations, :uniq => true
  has_many :project_areas, :uniq => true
  has_many :areas, through: :project_areas, :uniq => true
  # accepts_nested_attributes_for :project_areas, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
                  using: {tsearch: {dictionary: "russian"}}
                  
  def project_area_ids= ids
    ids.each do |id, attrs|
      begin
        ps = ProjectArea.find(id)
        if attrs.delete(:_destroy) =~ /^(true|t|yes|y|1)$/i
          ps.destroy
        else
          ps.update_attributes attrs
          ps.save
        end
      rescue ActiveRecord::RecordNotFound
        puts "====================================="
        unless attrs.delete(:_destroy) =~ /^(true|t|yes|y|1)$/i
          puts "-----------------------------------"
          ps = ProjectArea.new attrs
          ps.project = self
          ps.save
        end
      end
    end
  end
  def specialization_ids= ids
    ids.each do |id|
      spec = Specialization.find(id)
      self.specializations << spec
      self.areas << spec.area
    end
  end
  def self.text_search query
    if query.present?
      search(query)
    else
      scoped
    end
  end
  
end
