class ChangeAccreditedInvestorBooleanToDefaultFalse < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.change :investor_status, :boolean, default: false
    end
  end
end
