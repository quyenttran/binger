class Song < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :artist

  validates :name, presence: true, uniqueness: { scope: :artist }
end
