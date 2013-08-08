class AddProjectIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :project_id, :integer, after: :name 
  end
end
