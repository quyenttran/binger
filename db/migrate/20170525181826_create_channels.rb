class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :guidebox_id
      t.string :artwork_url

      t.timestamps(null: false)
    end
  end
end
