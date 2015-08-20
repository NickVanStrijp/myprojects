class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.date :start_date
      t.date :end_date
      t.text :project_desc

      t.timestamps null: false
    end
  end
end
