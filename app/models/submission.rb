class Submission < ActiveRecord::Base
  attr_accessible :title, :user_id, :category_id, :plattform_id, :url, :description
  has_many :assets
  accepts_nested_attributes_for :assets
  has_attached_file :screenshot, :path => "/tmp/iii"

end
