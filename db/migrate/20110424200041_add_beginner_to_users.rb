class AddBeginnerToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.boolean :beginner, :default => false
    end
    User.update_all ["beginner = ?", false]
  end

  def self.down
    remove_column :users, :beginner
  end
end
