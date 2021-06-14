class UserRepresenter < Api::V1::UsersController
  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      username: user.username,
      email: user.email,
      fName: user.fName,
      lName: user.lName,
    }
  end

  private

  attr_reader :user
end