class Plattform < ActiveRecord::Base
  attr_accessible :name, :description, :shortname
  has_many :submissions
end
