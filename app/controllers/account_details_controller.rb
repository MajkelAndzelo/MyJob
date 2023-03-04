class AccountDetailsController < ApplicationController
  def show
    @user = Current.user
    @last_logged_in_at = @user.last_logged_in_at
  end
  
end
