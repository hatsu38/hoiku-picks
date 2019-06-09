# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    if auth.present?
      # 認証UidとProviderから探す
      authorization = Authorization.find_from_auth(auth)
      # AuthorizationになかったらAuthorizationとUserを作る
      authorization ||= Authorization.create_from_auth(auth)
      @user = authorization.user
      session[:user_id] = @user.id
      redirect_to @user, notice: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render root_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'ログアウトしました。'
    redirect_to root_path
  end
end
