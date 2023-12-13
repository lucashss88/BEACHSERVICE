class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    # Personalize o redirecionamento após o login
    if resource.is_a?(User)
      # Redireciona para a página desejada após o login do usuário
      new_client_path
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    # Personalize o redirecionamento após o registro
    if resource.is_a?(User)
      # Redireciona para a página desejada após o registro do usuário
      user_session_path
    else
      super
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nome, :email, :password, :password_confirmation,
                         :current_password)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit( :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nome, :email, :password, :password_confirmation,
                         :current_password)
    end
  end
end
