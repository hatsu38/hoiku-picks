# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :authenticate

  private

  def current_user
    # Userが存在しない時には、session[:user_id]=nil をした方がいい？
    return unless session[:user_id]

    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?

    redirect_to root_path, alert: 'ログインしてください'
  end
end
