class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :yesterday
      t.text :today
      t.text :roadblocks

      t.timestamps
    end
  end
end
