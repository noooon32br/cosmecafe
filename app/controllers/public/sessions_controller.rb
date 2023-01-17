# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_ban!, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  
  def user_ban!
    @user = User.find_by(login_id: params[:user][:login_id])
    return if @user.nil?
    return unless @user.valid_password?(params[:user][:password])
    if @user.is_banned
      redirect_to new_user_session_path, alert: "現在利用停止中です。" 
    end
  end
end
