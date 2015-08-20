class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :risk_source
      t.integer :risk_probability
      t.integer :risk_impact
      t.string :risk_status
      t.text :risk_plan

      t.timestamps null: false
    end
  end
end
