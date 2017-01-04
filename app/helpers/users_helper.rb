module UsersHelper
  def avator_url(user)
    if user.image?
      user.image.thumb.url
    else
      if user.male?
        'boy.jpg'
      else
        'girl.jpg'
      end
    end
  end
end
