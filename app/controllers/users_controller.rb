class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  	@user = current_user
  	@user.update(user_params)
  end

  private

  def user_params
  	params.require(:user).permit(:fun_level)
  end
end


