class Screenshot < ActiveRecord::Base
  belongs_to :submission
  has_attached_file :image, :styles => {
    :mini  => "50x50#",
    :thumbsquare  => "150x150#",
    :thumb  => "150x150",
    :medium => "300x300",
    :large  => "600x600" }
end
