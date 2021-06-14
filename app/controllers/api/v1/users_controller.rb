class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :authorized, only: [:show, :destroy]

  # GET /users/:id
  def show
    render json: UserRepresenter.new(@user).as_json, status: :ok
  end


  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    token = encode_token({user_id: @user.id})
    @user.token = token
    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  #DELETE /users/:id
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :fName, :lName)
  end
end