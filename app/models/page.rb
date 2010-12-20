class Page < ActiveRecord::Base
  attr_accessible :name, :content, :permalink
end
