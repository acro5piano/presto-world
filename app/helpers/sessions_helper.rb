module SessionsHelper
  def logged_in?
    session[:teacher_id] != nil
  end

  def current_teacher
    return nil if !session[:teacher_id]
    Teacher.find(session[:teacher_id])
  end
end
