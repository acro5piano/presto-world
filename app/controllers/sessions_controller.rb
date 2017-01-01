class SessionsController < ApplicationController
  def new
  end

  def create
    flash[:success] = 'ログインしました'
    redirect_to root_path
  end

  def destroy
    flash[:success] = 'ログアウトしました'
    session[:teacher_id] = nil
    redirect_to root_path
  end
end
