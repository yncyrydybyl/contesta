class Submission < ActiveRecord::Base
  attr_accessible :title, :user_id, :category_id, :plattform_id, :url, :description
end
