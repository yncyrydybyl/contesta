class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.integer :submission_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :screenshots
  end
end
