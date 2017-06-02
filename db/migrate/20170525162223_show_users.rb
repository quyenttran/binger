class ShowUsers < ActiveRecord::Migration
  def change
    create_table :show_users do |t|
      t.integer :user_id, :show_id

      t.timestamps(null: false)
    end
  end
end
