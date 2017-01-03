class SessionsController < ApplicationController
  # メールアドレス認証が必要になってきた頃に導入する
  # 現在はFacebook認証のみを使っているので、必要ない
  # def new
  # end

  def create
    flash[:success] = 'ログインしました'
    redirect_to root_path
  end

  def destroy
    flash[:success] = 'ログアウトしました'
    session[:user_id] = nil
    redirect_to root_path
  end
end
