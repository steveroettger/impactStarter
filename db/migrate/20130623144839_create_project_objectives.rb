class CreateProjectObjectives < ActiveRecord::Migration
  def change
    create_table :project_objectives do |t|
      t.string :name

      t.timestamps
    end
  end
end
