class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :ref_title
      t.text :ref_desc
      t.string :ref_link
      t.string :ref_type

      t.timestamps null: false
    end
  end
end
