class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :date_time
      t.string :title
      t.string :entry_text
      t.integer :user_id
      t.integer :journal_id
     

      t.timestamps
    end
  end
end
