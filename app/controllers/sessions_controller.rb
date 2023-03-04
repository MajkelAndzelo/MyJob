class SessionsController < ApplicationController
    def new
    end
  
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          Current.user = user
          Current.user.update(last_logged_in_at: Time.now)
          session[:user_id] = user.id
        redirect_to root_path, notice: "Successfully logged in."
      else
        flash.now.alert = "Invalid email or password."
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out"
    end
  end
  