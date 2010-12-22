class CreatePlattforms < ActiveRecord::Migration
  def self.up
    create_table :plattforms do |t|
      t.string :name
      t.text :description
      t.string :shortname
      t.timestamps
    end
  end

  def self.down
    drop_table :plattforms
  end
end
