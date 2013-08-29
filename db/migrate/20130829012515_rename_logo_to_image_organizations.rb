class RenameLogoToImageOrganizations < ActiveRecord::Migration
  
  def change
    rename_column :organizations, :logo, :image
  end
  
end
