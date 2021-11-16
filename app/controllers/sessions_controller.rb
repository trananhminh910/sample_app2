class SessionsController < ApplicationController
  def create
    user = User.find_by account_name: params[:session][:account_name].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = t "invalid_account_password_combination"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
