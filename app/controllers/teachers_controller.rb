class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  def show
  end

  def register_with_facebook
    if !params[:token]
      flash[:danger] = '登録できませんでした'
      redirect_to '/' and return
    end

    # TODO: ここをFacebookのAPIで取得する
    facebook_user_info = {
      name: 'kazuya',
      age: 23,
      educational_background: '1284',
    }
    teacher = Teacher.new(facebook_user_info)
    if teacher.save
      flash[:success] = '登録が完了しました'
      session[:teacher_id] = teacher.id
      redirect_to '/'
    else
      flash[:danger] = '登録できませんでした'
      redirect_to '/'
    end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      flash[:success] = 'Teacher was successfully created.'
      redirect_to @teacher
    else
      render :new
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      flash[:success] = 'Teacher was successfully updated.'
      redirect_to @teacher
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    flash[:success] = 'Teacher was successfully destroyed.'
    redirect_to teachers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:name, :age, :educational_background, :vision, :strength, :shift_id)
    end
end
