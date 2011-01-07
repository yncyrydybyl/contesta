class Submission < ActiveRecord::Base
  attr_accessible :title, :user_id, :category_id, :plattform_id, :url, :description, :screenshots_attributes, :artefact
  has_many :screenshots
  accepts_nested_attributes_for :screenshots
  has_attached_file :artefact
end
