class UsersController < ApplicationController
  def show
		@user=User.find(params[:id])
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
    	redirect_to @user
    else
    	render 'new'
    end
	end



	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
