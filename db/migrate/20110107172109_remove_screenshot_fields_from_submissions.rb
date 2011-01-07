class RemoveScreenshotFieldsFromSubmissions < ActiveRecord::Migration
  def self.up
    remove_column :submissions, :screenshot_file_name
    remove_column :submissions, :screenshot_content_type
    remove_column :submissions, :screenshot_file_size
    remove_column :submissions, :screenshot_updated_at
  end

  def self.down
    add_column :submissions, :screenshot_updated_at, :datetime
    add_column :submissions, :screenshot_file_size, :integer
    add_column :submissions, :screenshot_content_type, :string
    add_column :submissions, :screenshot_file_name, :string
  end
end
