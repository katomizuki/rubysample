class ApplicationController < ActionController::Base
  ## helperメソッドとしてViewで使えるようにする
helper_method :current_user

  def login
    ## ログインがされているかどうか確認
    if current_user.nil?
      redirect_to login_path, alert: "You have to log in."
    end
  end

  def already 
    ## 現在のユーザーがnilか確認。unlessはifの逆の意味
    unless current_user.nil?
      redirect_to user_path, notice: "You are already logged in."
    end
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
  
end
