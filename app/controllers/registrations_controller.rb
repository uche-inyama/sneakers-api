class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authorized, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(user: @user).welcome_email.deliver_later
        format.json { render json: @user }
      else
        format.json { render json: :unprocessable_entity } 
      end
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