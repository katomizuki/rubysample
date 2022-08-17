class SessionsController < ApplicationController
  before_action :already, except: :destroy
  def new
  end

  def create 
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインに成功したよ"
    else 
      flash.now[:alert] = "メールかパスワードが違いますよ"
      ## new画面に戻る。
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out."
  end 
end
