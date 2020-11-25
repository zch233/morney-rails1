class UsersController < ApplicationController
  def create
    render_resource User.create create_params
  end
  def current_user_info
    render_resource current_user
  end
  def index
    render_resource User.all
  end
  def destroy
    render_resource User.destroy params[:id]
  end
  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
