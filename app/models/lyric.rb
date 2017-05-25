class Lyric < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tab

  validates :lyric, presence: true
end
