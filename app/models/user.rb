require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :tabs

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /([\w]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})/ }
  validate :password_cannot_be_blank

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password_cannot_be_blank

  end
end
