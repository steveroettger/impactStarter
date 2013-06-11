class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title,       :null => false
      t.string :organization
      t.text   :description, :null => false
      t.string :image
      t.string :video_url
   
      t.timestamps
    end
  end
  
  def self.down
    drop_table :projects
  end
  
end
