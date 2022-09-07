class SessionsController < Devise::RegistrationsController
  # skip_before_action :verify_signed_out_user, only: :destroy
  skip_before_action :authorized, only: [:create]

  def new
    super
  end

   def create
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      token = encode_token(user_id: @user.id)
      render json: { current_user: @user, token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def update
    super
  end

  def destroy
    head :no_content
  end
end