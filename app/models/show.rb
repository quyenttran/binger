class Show < ActiveRecord::Base
  # Remember to create a migration!
  has_many :viewers, through: :song_users, class_name: "User"
end
