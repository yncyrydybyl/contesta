class Asset < ActiveRecord::Base
  belongs_to :submission
  has_attached_file :screenshot, :styles => {
    :thumb => "150x150#",
    :medium => "300x300",
    :large => "600x600"}
end
