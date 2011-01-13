class Submission < ActiveRecord::Base
  attr_accessible :title, :user_id, :category_id, :plattform_id, :url, :description, :screenshots_attributes, :artefact
  has_many :screenshots
  belongs_to :category
  belongs_to :plattform
  belongs_to :user
  validates_associated :category, :plattform, :user
  accepts_nested_attributes_for :screenshots
  has_attached_file :artefact
end
