class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def edit
    end
  
    def update
      @user = User.find(params[:id])
  
      # Check if the user provided the correct current password
      if !@user.authenticate(params[:user][:current_password])
        flash[:alert] = "Invalid current password."
        render :edit, status: :unprocessable_entity
        return
      end
  
      # Update the user's email and password
      if @user.update(user_params)
        bypass_sign_in(@user) # Sign in the user with the new password
        redirect_to account_details_path, notice: "Account details updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  