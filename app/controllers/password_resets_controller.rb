class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def edit; end

  def update
    if user_params[:password].empty?
      render :edit
    elsif @user.update_attributes user_params
      flash[:info] = t "reset_pass_success"
      redirect_to controller: :sessions, action: :new
    else
      render :edit
    end
  end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "sent_password_to_email"
      redirect_to root_url
    else
      flash.now[:danger] = t "not_found_email"
      render :new
    end
  end

  private

  def get_user
    @user = User.find_by email: params[:email]
  end

  def valid_user
    return if (@user && @user.activated && @user.authenticated?(:reset, params[:id]))
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def check_expiration
    return unless @user.password_reset_expired?
    flash[:danger] = t "has_expired_set_password"
    redirect_to new_password_reset_url
  end
end
