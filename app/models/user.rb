class User < ApplicationRecord
  validates :username, :email,:token, :password_hash, :fName, :lName, presence: true
  validates :username, :email, uniqueness: true
  validates_format_of :email, with: /@/

  has_many :books

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def get_user_books
    self.books
  end
end