class Camrade < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :middle_name, :last_name, :birth_date, :sex
  attr_accessible :resumes_attributes
  has_many :contacts
  has_many :resumes
  has_many :services
  has_many :requests
  has_many :comments
  has_many :projects
  belongs_to :country
  belongs_to :city
  
  accepts_nested_attributes_for :resumes, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
