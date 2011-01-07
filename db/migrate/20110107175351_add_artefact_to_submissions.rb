class AddArtefactToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :artefact_file_name, :string
    add_column :submissions, :artefact_content_type, :string
    add_column :submissions, :artefact_file_size, :integer
    add_column :submissions, :artefact_updated_at, :datetime
  end

  def self.down
    remove_column :submissions, :artefact_updated_at
    remove_column :submissions, :artefact_file_size
    remove_column :submissions, :artefact_content_type
    remove_column :submissions, :artefact_file_name
  end
end
