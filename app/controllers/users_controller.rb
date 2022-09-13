class UsersController < ApplicationController
  before_action :already, only: [:new, :create]
  before_action :login, only: :show

  def new
  @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      ## noticeは処理が成功した時に出すアラート　ちなみに失敗はaler
      redirect_to user_path, notice: "新規会員登録完了"
      ## アクションを介すのがredirect_to
    else 
      ## アクションを介さないのがrender
      render :new
    end
  end

   def show
    user_id = current_user.id
    @user = User.where(id: user_id).first
    attendances = Attendance.where(user_id: user_id)  
    @attendance = attendances.last
  end

  private
  def user_params
    ## :userにparamsが入ってくる。ストロングパラメータをチェックする
    params.require(:user).permit(:name,:email,:password)
  end
end
