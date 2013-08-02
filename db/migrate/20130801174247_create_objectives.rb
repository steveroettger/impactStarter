class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.integer :project_id
      t.text :content

      t.timestamps
    end
  end
end
