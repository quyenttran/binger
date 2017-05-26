class User < ActiveRecord::Base
  has_many :searches

  validates :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by(email: params[:email])
    (user && user.password == params[:password]) ? user : nil
  end

  def self.new_user(params)
    user = User.new(
      :username => params[:username],
      :email => params[:email] )
    user.password = params[:password]
    user
  end
end
