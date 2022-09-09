class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token(user_id: @user.id)
      render json: { current_user: @user, token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def sign_out
    log_out
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end