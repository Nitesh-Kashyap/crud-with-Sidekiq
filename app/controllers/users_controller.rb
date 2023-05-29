class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :remove]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_params)
    redirect_to users_path
  end

  def edit
  end

  def update
    #authorize @user
    role = Role.find params[:roles]
    if params[:commit].eql?("Add role")
      @user.add_role role.name.to_sym
      flash[:notice] = "Role Added Successfully!"
    else
      @user.remove_role role.name.to_sym
      flash[:alert] = "Role Removed Successfully!"
    end  
    redirect_to edit_user_path(@user)
  end

  private

  def current_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:email)
  end
end
