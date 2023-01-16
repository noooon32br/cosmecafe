# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(login_id: params[:user][:login_id])
    if user.valid_password?(params[:user][:password]) && user.is_banned == false
      sign_in user
      redirect_to user_path(user)
    else
      redirect_to new_user_session_path, flash[:notice] = "現在利用停止中です。" 
    end
  #   super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
