class Admins::RegistrationsController < Devise::RegistrationsController
  
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    respond_to do |format| 
      if @admin.save
        format.html { redirect_to products_path }
        format.json { render json: @admin }
      else
        render json: :unprocessable_entity
      end
    end
  end

  def update
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  private :admin_params
end
