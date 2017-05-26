class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :artwork_url
      t.integer :channel_id

      t.timestamps(null: false)
    end
  end
end
