# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]

  def show
  end

  def edit
    @user = current_user
    render action: :settings
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash['success'] = '更新しました'
      redirect_to user_path(@user)
    else
      flash['error'] = '更新に失敗しました'
      render action: :settings
    end
  end

  def destroy
    @user.destroy
    reset_session
    flash[:success] = '退会しました'
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image, :description)
  end
end
