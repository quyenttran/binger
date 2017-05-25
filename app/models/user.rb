class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tabs

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /([\w]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})/ }
  validate :password_cannot_be_blank

  def password_cannot_be_black

  end
end
