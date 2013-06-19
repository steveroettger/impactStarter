class AddStatusToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :status, :string, default: "Pending", after: :logo
  end
end
