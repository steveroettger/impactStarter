class RenamePhotoToImageInUsers < ActiveRecord::Migration

  def change
    rename_column :users, :photo, :image
  end
  
end
