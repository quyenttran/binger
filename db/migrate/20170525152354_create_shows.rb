class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title, :year, :artwork, :rating, :director, :summary, :cast, :category

      t.timestamps(null: false)
    end
  end
end
