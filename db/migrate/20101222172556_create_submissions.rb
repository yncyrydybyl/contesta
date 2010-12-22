class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :title
      t.integer :user_id
      t.integer :category_id
      t.integer :plattform_id
      t.string :url
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
