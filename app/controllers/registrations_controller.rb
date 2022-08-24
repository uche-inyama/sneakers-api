class RegistrationsController < Devise::RegistrationsController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: @user
    else
      render json: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  private :user_params
end