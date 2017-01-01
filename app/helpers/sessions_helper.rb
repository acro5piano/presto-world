module SessionsHelper
  def logged_in?
    session[:teacher_id] != nil
  end
end
