class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_owner
      t.date :task_start_date
      t.date :task_end_date

      t.timestamps null: false
    end
  end
end
