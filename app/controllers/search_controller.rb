class SearchController < ApplicationController
  def create
       
     @userrequest = Userrequest.new( :RequestFrom => current_user.id, :RequestTo => params[:id] , :IsApproved=> "0", :SkillType => "" )
     @userrequest.save

     redirect_to '/searching'
  end

  
  
  def search
    @students=Students.all
    
    #zip 
    if ( !params[:tf_Zip].blank? or params[:tf_Zip] != "" ) and ( params[:Interest] == "1" ) and (params[:tf_Designation] == "") and ( params[:tf_Company] == "")
       @user = User.find(:all,:conditions=>['"user_Zip" = ? ',params[:tf_Zip]])
    #interest
    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] != "1" ) and (params[:tf_Designation] == "") and (params[:tf_Company] == "")
       @user = User.find(:all,:conditions=>['"user_Need" = ? ',params[:Interest]])   
    #designation
    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] == "1" ) and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and (params[:tf_Company] =="")
       @user_join = Profession.joins(:user).where('"professions"."Designation" =?', params[:tf_Designation])
    #company
    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] == "1" ) and (params[:tf_Designation] == "") and ( !params[:tf_Company].blank? or params[:tf_Company] !="" )
       @user_join = Profession.joins(:user).where('"professions"."Company"' => params[:tf_Company])
    #ZipInterest
    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" )  and ( !params[:Interest].blank? or params[:Interest] !="1" ) and (params[:tf_Designation] == "") and (params[:tf_Company] == "")
       @user = User.find(:all, :conditions => ['"user_Zip" = ? AND "user_Need" = ? ',params[:tf_Zip], params[:Interest]])
    #ZipDesignation
    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" ) and ( !params[:Interest].blank? and  params[:Interest] == "1" ) and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and (params[:tf_Company] == "")
        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "professions"."Designation"= ?',params[:tf_Zip],params[:tf_Designation])
    #ZipCompany
    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" )  and ( !params[:Interest].blank? and  params[:Interest] == "1" ) and (params[:tf_Designation] == "")  and ( !params[:tf_Company].blank? or params[:tf_Company] !="" )
        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "professions"."Company" = ?', params[:tf_Zip], params[:tf_Company])   
    #InterestDesignation
    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and ( params[:tf_Company] == "" )
        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Designation"= ?',params[:Interest],params[:tf_Designation])
    #InterestCompany
    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] =="" ) and ( params[:tf_Company] != "" )
        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Company"= ?',params[:Interest],params[:tf_Company])
    #DesignatinCompany
    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] =="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
        @user_join = Profession.joins(:user).where('"professions"."Designation" = ? AND "professions"."Company"= ?',params[:tf_Designation], params[:tf_Company])
    #ZipInterestDesignation
    elsif (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] == "" )
        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Designation"= ?',params[:tf_Zip], params[:Interest], params[:tf_Designation])
    #ZipInterestCompany    
    elsif (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] =="" ) and ( params[:tf_Company] != "" )
        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Company"= ?',params[:tf_Zip], params[:Interest], params[:tf_Company])
    #InterestDesignationCompany
    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Designation"= ? AND "professions"."Company" = ?', params[:Interest], params[:tf_Designation], params[:tf_Company])
   
    else (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Designation"= ? AND "professions"."Company"= ?',params[:tf_Zip], params[:Interest], params[:tf_Designation], params[:tf_Company])
    
       
  	end   	
  	    render 'search'
  end 
end