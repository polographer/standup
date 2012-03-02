class AddUserIdToEntries < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.integer :user_id
    end
  end
end
