class ChangeStatusTypeToProjects < ActiveRecord::Migration
  def change
    change_table(:projects) do |t|
      t.change :status, :boolean, default: false
    end
  end
end
