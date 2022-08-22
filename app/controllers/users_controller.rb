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

  def month 
    month_str = params[:month]
    month_date = Date.strptime(month_str, '%Y-%m')
    @month = month_date.month
    @year = month_date.year
  end


  def show
    user_id = current_user.id

    attendances = Attendance.where(user_id: user_id)  
    @attendance = attendances.last
    attendance = attendances.last
    if attendance.start_time != nil && attendance.end_time != nil
      @workstatus = "勤務してないよ"
    else 
      @workstatus = "勤務中だよ"
      if attendance.rest_start_time != nil && attendance.rest_end_time == nil
        @workstatus = "休憩中だよ"
      end
    end
  end

  private
  def user_params
    ## :userにparamsが入ってくる。ストロングパラメータをチェックする
    params.require(:user).permit(:name,:email,:password)
  end
end
