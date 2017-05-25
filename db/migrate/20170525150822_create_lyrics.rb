class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :lyric, null: false
      t.string :chord
      t.integer :tab_id, null: false

      t.timestamps(null:false)
    end
  end
end
