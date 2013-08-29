class AddFieldsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :description, :text, after: :name
    add_column :organizations, :user_id, :integer, after: :logo
  end
end
