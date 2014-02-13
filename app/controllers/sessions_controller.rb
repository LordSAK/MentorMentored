class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password]) && (params[:session][:user_Type].to_s == user.user_Type.to_s)
			if params[:session][:SkillType].to_s == "Students" && user.SkillType
				sign_in user
				redirect_to '/default'
				#render 'new'
			elsif params[:session][:SkillType].to_s == "Entrepreneurs" && user.SkillType1
				sign_in user
				#redirect_to '/default'
				render 'new'
			elsif params[:session][:SkillType].to_s == "Veterans" && user.SkillType2
				sign_in user
				#redirect_to '/default'
				render 'new'
			else
				flash.now[:error] = 'Invalid email/password combination'
	    		render 'new'
	    	end		
	    else
	    	flash.now[:error] = 'Invalid email/password combination'
	    	render 'new'
	    end
	end

	def destroy 
		sign_out
		redirect_to root_url
	end
end
