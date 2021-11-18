class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
                 .paginate(page: params[:page], per_page: Settings.length.digit_10)
  end

  def show
    fetch_current_user
    unless @user
      flash[:danger] = t "error_not_find"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "check_mail_message"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    fetch_current_user
    unless @user
      flash[:danger] = t "error_not_find"
      redirect_to root_path
    end
  end

  def update
    fetch_current_user
    if @user.update_attributes(user_params)
      flash[:success] = t "updated_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    fetch_current_user
    if @user&.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_failed"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user)
          .permit :name, :account_name, :email, :age, :gender, :password, :password_confirmation
  end

  def fetch_current_user
    @user = User.find_by(id: params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "login_please"
      redirect_to login_url
    end
  end

  def correct_user
    fetch_current_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
