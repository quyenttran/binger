class Song < ActiveRecord::Base
  # Remember to create a migration!
  has_many :listeners, through: :song_users, class_name: "User"
end
