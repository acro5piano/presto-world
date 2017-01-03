class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def facebook_user_info(uid, token)
    uri = URI("https://graph.facebook.com/v2.8/#{uid}")
    uri.query = URI.encode_www_form({ access_token: token,
                                      fields: 'id,name,gender,email,birthday' })
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body, symbolize_names: true)
  end

  def current_user
    return nil if !session[:user_id]
    User.find(session[:user_id])
  end
end
