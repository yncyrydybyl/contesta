class AddAbstractToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :abstract, :string
  end

  def self.down
    remove_column :submissions, :abstract
  end
end
