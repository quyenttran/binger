class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.integer :user_id, null: false
      t.integer :song_id, null: false

      t.timestamps(null:false)
    end
  end
end
