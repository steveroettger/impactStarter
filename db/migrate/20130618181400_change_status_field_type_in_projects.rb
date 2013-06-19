class ChangeStatusFieldTypeInProjects < ActiveRecord::Migration
  def change
    change_table(:projects) do |t|
      t.change :status, :string, default: "Pending"
    end
  end
end
