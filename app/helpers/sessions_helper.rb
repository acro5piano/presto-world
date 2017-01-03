module SessionsHelper
  def current_user
    return nil if !session[:user_id]
    User.find(session[:user_id])
  end
end
