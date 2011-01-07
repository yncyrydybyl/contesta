class RemoveAssets < ActiveRecord::Migration
  def self.up
    drop_table :assets
  end

  def self.down
    create_table :assets do |t|
      t.integer :submission_id

      t.timestamps
    end
  end
end
