class Submission < ActiveRecord::Base
  attr_accessible :title, :user_id, :category_id, :platform_id, :url, :description, :screenshots_attributes, :artefact, :abstract
  has_many :screenshots
  belongs_to :category
  belongs_to :platform
  belongs_to :user
  validates_associated :category, :platform, :user
  validates :title, :length => { :maximum => 100 }
  validates :url, :length => { :maximum => 256 }
  validates :abstract, :length => { :maximum => 1000 }
  validates :description, :length => { :maximum => 5000 }
  accepts_nested_attributes_for :screenshots
  has_attached_file :artefact
end
