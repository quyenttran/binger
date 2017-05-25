class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :lyric, null: false
      t.string :chord

      t.timestamps(null:false)
    end
  end
end
