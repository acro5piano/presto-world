module UsersHelper
  def avator_url(user)
    if user.avatar?
      user.avatar.url
    else
      if user.male?
        'boy.jpg'
      else
        'girl.jpg'
      end
    end
  end
end
