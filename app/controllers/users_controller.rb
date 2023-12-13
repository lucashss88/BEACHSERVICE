class Users::UsersController < Devise::RegistrationsController
  layout 'registrations'
  before_action :configure_permitted_parameters
  def create
    @user = User.new(user_params) # Criando uma nova instância de User
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :client_id, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :client_id, :password, :password_confirmation)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:client_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:client_id])
  end
end
