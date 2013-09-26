class AddAccreditedInvestorBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :investor_status, :boolean
    add_column :users, :investor_type, :string, after: :investor_status
  end
end
