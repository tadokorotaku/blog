class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :block_user
  before_action :set_user, only: [:update]

  def index
    @users = User.order(id: :asc)
  end

  def update
    @user.admin? ? @user.user! : @user.admin!
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def block_user
      redirect_to root_path unless current_user.admin?
    end
end