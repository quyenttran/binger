class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, :year, :artwork, :rating, :director, :summary, :cast

      t.timestamps(null: false)
    end
  end
end
