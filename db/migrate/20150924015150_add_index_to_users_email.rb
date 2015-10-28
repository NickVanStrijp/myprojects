class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :user_email, unique: true
  end
end
