class SessionsController < Devise::RegistrationsController
  skip_before_action :verify_signed_out_user, only: [:destroy]
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

  private

  def verify_signed_out_user
    if all_signed_out?
      set_flash_message! :notice, :already_signed_out
      respond_to_on_destroy
    end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }
    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end