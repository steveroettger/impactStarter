class AddFundingFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :seeking_amount, :string
    add_column :projects, :funded_amount,  :string
  end
end
