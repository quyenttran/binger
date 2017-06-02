require 'bcrypt'
class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :assessments
  has_many :songs, through: :song_users, foreign_key: :listener_id
  has_many :shows, through: :show_users, foreign_key: :viewer_id
  validate :password_present
  validates :username, presence: { message: "must have a username" }, uniqueness: { message: "already exists" }
  validates :email, format: { with: /\w+@\w+.\w+/, message: "must be valid email"}, uniqueness: { message: "already exists" }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user && user.password == password
  end

  private
  def password_present
    errors.add(:password, "cannot be blank") if self.password == ""
  end

end
