class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :check_user, only: [:update]

  # GET /users
  def index
    @q = User.where(is_teacher: true).search(get_query('query_user'))
    @users = @q.result.paginate(page: params[:page],
                                per_page: 10)
  end

  # GET /users/1
  def show
  end

  def register_with_facebook
    if !params[:uid] || !params[:token]
      flash[:danger] = '登録できませんでした'
      redirect_to '/' and return
    end

    fb_data = facebook_user_info(params[:uid], params[:token])

    # Tokenを使ってUIDが一致するかを見る
    # 一致していたらログイン処理
    # TODO: モデルかヘルパー側に処理を移すべき。
    # TODO: ログイン処理はsessions_helperに一元化したい
    if (user = User.find_by(uid: fb_data[:id]))
      flash[:success] = 'ログインしました'
      session[:user_id] = user.id
      redirect_to '/' and return
    end

    facebook_user_info = {
      name: fb_data[:name],
      sex: (fb_data[:gender] == 'male') ? 1 : 2,
      email: fb_data[:email],
      uid: fb_data[:id],
      provider: 'facebook',
      token: params[:token],
    }
    user = User.new(facebook_user_info)
    if user.save
      flash[:success] = '登録が完了しました'
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      flash[:danger] = '登録できませんでした'
      redirect_to '/'
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '登録が完了しました'
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'プロフィールが更新されました'
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = '正常に退会しました'
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :sex, :email, :birth_day,
                                   :is_teacher, :educational_background,
                                   :vision, :strength, :avatar,
                                   User.shift_times)
    end

    # user can edit its profile
    def check_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user == @user
    end
end
