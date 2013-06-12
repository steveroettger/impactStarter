class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :entity_type
      t.string :tax_status
      t.string :logo
      
      t.timestamps
    end
  end
end
