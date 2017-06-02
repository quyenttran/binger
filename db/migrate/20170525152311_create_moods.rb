class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :pumped, :tired, :lol, :in_love
    end
  end
end
