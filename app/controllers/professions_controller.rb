class ProfessionsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
	
  def index
  end

  def create
    @blah=params[:Professions][:tf_Designation]
    if !params[:Professions][:tf_Designation].blank?
       @Designation = params[:Professions][:tf_Designation]
       @Company = params[:Professions][:tf_Company]
       @From = params[:Professions][:fromyear]
       @To = params[:Professions][:toyear]
       @Profession = Profession.new( :UserID => current_user.id, :Designation => @Designation, :Company => @Company, :Job_From => @From, :Job_To => @To)
       @Profession = @Profession.save
    end
       redirect_to '/educations'
  end

  def destroy
  end


  def new
  	@Profession = Profession.new
  end
end
