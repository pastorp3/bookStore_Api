class User < ApplicationRecord
  validates :username, :email, :password_hash, :fName, :lName, presence: true
  validates :username, :email, uniqueness: true

  has_many :books

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end