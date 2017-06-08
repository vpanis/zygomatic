class UsersController < ApplicationController
  before_action :set_user, only: :update

  def update
  	current_user.update(user_params)
  end

  private

  def set_user
  	User.find(params[:id])
  end
  
  def user_params
  	params.require(:user).permit(:fun_level)
  end
end


