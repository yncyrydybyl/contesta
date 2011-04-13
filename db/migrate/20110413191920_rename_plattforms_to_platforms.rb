class RenamePlattformsToPlatforms < ActiveRecord::Migration
  def self.up
    rename_table :plattforms, :platforms
    rename_column :submissions, :plattform_id, :platform_id
  end

  def self.down
    rename_table :platforms, :plattforms
    rename_column :submissions, :platform_id, :plattform_id
  end
end
