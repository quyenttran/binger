class Tab < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :song
  belongs_to :user
  has_many :lyrics

  validates :song_id, :user_id, presence: true
end
