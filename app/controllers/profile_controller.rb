class ProfileController < ApplicationController
  def create
  end

  def profile
  	if params[:id].nil?
  		 @user_id=current_user.id
  		 @user=User.find(@user_id)
  	   @user_education = Education.where(:UserID => current_user.id.to_s)
       @user_communication = Communication.where(:UserID => current_user.id)
       @user_profession = Profession.where(:UserID => current_user.id.to_s)
       @user_availability = Availability.where(:UserID => current_user.id)
  	else
  		 @user_id= params[:id]
       @user=User.find(@user_id)
       @user_education = Education.where(:UserID => params[:id])
       @user_communication = Communication.where(:UserID => params[:id])
       @user_profession = Profession.where(:UserID => params[:id] )
       @user_availability = Availability.where(:UserID => params[:id] )
  	end
  end
end
