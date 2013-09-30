class ChangeStatusTypeToProjects < ActiveRecord::Migration
  def change
    change_table(:projects) do |t|
      t.change :status, :boolean
    end
  end
end
