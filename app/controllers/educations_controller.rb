class EducationsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
	
  def index
  end

  def create
  	if !params[:Educations][:tf_Degree].blank? && params[:Educations][:tf_Degree] != "Degree"
  	@Degree = params[:Educations][:tf_Degree]
  	@From = params[:Educations][:fromyear]
  	@To = params[:Educations][:toyear]
  	@Education = Education.new( :UserID => current_user.id, :SchoolName => @Degree, :SchoolFrom => @From, :SchoolTo => @To )
  	@Education = @Education.save
  	end
  	redirect_to '/default'
  end

  def destroy
  end

  def new
  	@Education = Education.new
  end
end
