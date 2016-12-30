class SessionsController < ApplicationController
  def new
  end

  def create
    flash[:success] = 'ログインしました'
    redirect_to root_path
  end

  def destroy
  end
end
