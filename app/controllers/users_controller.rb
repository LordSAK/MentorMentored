class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user=User.find(params[:id])
    @user_name=@user.First_Name
    if !@user.Last_Name.blank?
      @user_name += " "+@user.Last_Name
    end
  end

  def new
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user = User.new
  end

  def create
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Mentor Mentored!"
      redirect_to '/default'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

	private

    def user_params
      params.require(:user).permit(:First_Name,:Last_Name, :email, :password,
                                   :password_confirmation, :user_type, :SkillType, :user_Need,
                                   :SkillType1, :SkillNeed1, :SkillType2, :skillNeed2)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
