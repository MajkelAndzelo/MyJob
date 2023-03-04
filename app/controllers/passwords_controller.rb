class PasswordsController < ApplicationController
    before_action :require_user_logged_in!
  
    def edit
    end
  
    def update
      if Current.user.update_with_password(user_params)
        redirect_to root_path, notice: "Password updated successfully!"
      else
        flash.now[:alert] = "Current password is wrong."
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
  end
  