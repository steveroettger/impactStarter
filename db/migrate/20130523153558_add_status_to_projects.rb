class AddStatusToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status, :string, after: :video_url
  end
end
