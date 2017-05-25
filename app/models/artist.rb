class Artist < ActiveRecord::Base
  # Remember to create a migration!
  has_many :songs

  validates :name, uniqueness: true, presence: true

end
