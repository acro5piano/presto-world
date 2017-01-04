module UsersHelper
  # def avator_thumbnail_url(user)
  #   if user.image?
  #     user.image.thumb.url
  #   else
  #     if user.gender
  #       'girl.jpg'
  #     else
  #       'boy.jpg'
  #     end
  #   end
  # end

  def avator_url(user)
    if user.image?
      user.image.thumb.url
    else
      if user.gender
        'girl.jpg'
      else
        'boy.jpg'
      end
    end
  end
end
