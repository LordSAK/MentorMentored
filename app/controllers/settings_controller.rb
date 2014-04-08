class SettingsController < ApplicationController
 #caches_page :index, :show  
 #skip_before_filter :verify_authenticity_token, :only => [:index, :show, :create, :destroy]

  def create
    @user_basic=User.find(current_user.id)
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user_profession=Profession.where(:UserID => current_user.id)
    @user_education=Education.where(:UserID => current_user.id)
    @user_communication=Communication.where(:UserID => current_user.id)
    
    #requestfrom.first.update_attribute(:IsApproved, "2")
    @user_basic.update_attribute( :user_Need, params[:user_Need])
    @user_basic.update_attribute( :SkillNeed1, params[:SkillNeed1])
    @user_basic.update_attribute( :skillNeed2, params[:SkillNeed2])    
    
        @blah = params[:ChkBx_Profession]
  if params[:ChkBx_Profession] == "1"
    Profession.delete_all(:UserID => current_user.id)
    if !params[:tf_designation].blank?
        @desig = params[:tf_designation]
        @comp = params[:tf_company]
        @fromdesigcom = params[:tf_fromdesignation]
        @todesigcom = params[:tf_todesignation]
        @Profession = Profession.new( :UserID => current_user.id, :Designation => @desig, :Company => @comp, :Job_From => @fromdesigcom, :Job_To => @todesigcom, :Private? => "1" )
        @Profession.save
    end

    if !params[:parameters].blank?
    params[:parameters].each do |keydesignation, designation|
      if !designation.nil?
        @designation = designation
        puts @designation
        params[:parametersCompany].each do |keycompany, company|
          if keydesignation == keycompany
            @company = company
          end
        end  
        params[:ParametersFromProf].each do |keyfromprof, fromprof|
          if keydesignation == keyfromprof
            @from = fromprof
          end
        end
        params[:ParametersToProf].each do |keytopro, toprof|
          if keydesignation == keytopro
            @to=toprof          
          end
        end
        @Profession = Profession.new( :UserID => current_user.id, :Designation => @designation, :Company => @company, :Job_From => @from, :Job_To => @to, :private? => "1")
        @Profession.save
      end
    end  
    end
  else
        Profession.delete_all(:UserID => current_user.id)
    if !params[:tf_designation].blank?
        @desig = params[:tf_designation]
        @comp = params[:tf_company]
        @fromdesigcom = params[:tf_fromdesignation]
        @todesigcom = params[:tf_todesignation]
        @Profession = Profession.new( :UserID => current_user.id, :Designation => @desig, :Company => @comp, :Job_From => @fromdesigcom, :Job_To => @todesigcom, :Private? => "0" )
        @Profession.save
    end

    if !params[:parameters].blank?
    params[:parameters].each do |keydesignation, designation|
      if !designation.nil?
        @designation = designation
        puts @designation
        params[:parametersCompany].each do |keycompany, company|
          if keydesignation == keycompany
            @company = company
          end
        end  
        params[:ParametersFromProf].each do |keyfromprof, fromprof|
          if keydesignation == keyfromprof
            @from = fromprof
          end
        end
        params[:ParametersToProf].each do |keytopro, toprof|
          if keydesignation == keytopro
            @to=toprof          
          end
        end
        @Profession = Profession.new( :UserID => current_user.id, :Designation => @designation, :Company => @company, :Job_From => @from, :Job_To => @to, :Private? => "0" )
        @Profession.save
      end
    end  
    end
  end  
    @blah2 = params[:ChkBx_Education]
  if params[:ChkBx_Education].to_s == "1"
    Education.delete_all(:UserID => current_user.id)
    if !params[:tf_education].blank?
        @education = params[:tf_education]
        @fromeducation = params[:tf_fromeducation]
        @toeducation = params[:tf_toeducation]
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @education, :SchoolFrom => @fromeducation, :SchoolTo => @toeducation, :Private? => "1" )
        @Education.save
    end
    
    if !params[:parametersSch].blank?
    params[:parametersSch].each do |keydeg, degree|
      if !degree.nil?
        @degree=degree
        params[:ParametersFromSch].each do |keyfrom, from|
          if keydeg== keyfrom
            @from=from
          end
        end

        params[:ParametersToSch].each do |keyto, to|
          if keydeg==keyto
            @to=to          
          end
        end
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to, :Private? => "1" )
        @Education.save
      end
    end
    end
  else
    Education.delete_all(:UserID => current_user.id)
    if !params[:tf_education].blank?
        @education = params[:tf_education]
        @fromeducation = params[:tf_fromeducation]
        @toeducation = params[:tf_toeducation]
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @education, :SchoolFrom => @fromeducation, :SchoolTo => @toeducation, :Private? => "0" )
        @Education.save
    end
    
    if !params[:parametersSch].blank?
    params[:parametersSch].each do |keydeg, degree|
      if !degree.nil?
        @degree=degree
        params[:ParametersFromSch].each do |keyfrom, from|
          if keydeg== keyfrom
            @from=from
          end
        end

        params[:ParametersToSch].each do |keyto, to|
          if keydeg==keyto
            @to=to          
          end
        end
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to, :Private? => "0" )
        @Education.save
      end
    end
    end
  end
   

       
  if ( params[:ChkBx_Phone] == "1") or  (params[:ChkBx_Email] == "1")  or (params[:ChkBx_Skype] == "1")  or  (params[:ChkBx_Website] == "1") or  (params[:ChkBx_Twitter] == "1" )
    #if ( params[:ChkBx_Phone] == "1" or  params[:ChkBx_Email] == "1" or  params[:ChkBx_Website] == "1"  or  params[:ChkBx_Twitter] == "1" )
          @publicphone = params[:ChkBx_Phone]
          @publicemail = params[:ChkBx_Email]
          @publicskype = params[:ChkBx_Skype]
          @publicwebsite = params[:ChkBx_Website]
          @publictwitter = params[:ChkBx_Twitter]
    
    Communication.delete_all(:UserID => current_user.id)     
    if !params[:tf_Phone].blank?
        @Phone = "Phone"
        @Phone_detail = params[:tf_phone]
        @Phone_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private? => @publicphone, :Preferred => @Phone_Preferred)
        @communication.save
    end

    if !params[:tf_email].blank?
        @Email = "Email"
        @Email_detail = params[:tf_email]
        @Email_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private? => @publicemail, :Preferred => @Email_Preferred)     
        @communication.save
    end
    
    if !params[:tf_skype].blank?  
        @Skype = "Skype"
        @Skype_detail = params[:tf_skype]
        @Skype_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private? => @publicskype, :Preferred => @Skype_Preferred)
        @communication.save 
    end

    if !params[:tf_website].blank?  
      @Website = "Website"
      @Website_detail = params[:tf_website]
      @Website_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private? => @publicwebsite, :Preferred => @Website_Preferred)
      @communication.save
    end

    if !params[:tf_twitter].blank?  
      @Twitter = "Twitter"
      @Twitter_detail = params[:tf_twitter]
      @Twitter_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private? => @publictwitter, :Preferred => @Twitter_Preferred)
      @communication.save
    end
  else 
      Communication.delete_all(:UserID => current_user.id)     
    if !params[:tf_Phone].blank?
        @Phone = "Phone"
        @Phone_detail = params[:tf_phone]
        @Phone_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private? => "0", :Preferred => @Phone_Preferred)
        @communication.save
    end

    if !params[:tf_email].blank?
        @Email = "Email"
        @Email_detail = params[:tf_email]
        @Email_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private? => "0", :Preferred => @Email_Preferred)     
        @communication.save
    end
    
    if !params[:tf_skype].blank?  
        @Skype = "Skype"
        @Skype_detail = params[:tf_skype]
        @Skype_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private? => "0" , :Preferred => @Skype_Preferred)
        @communication.save 
    end

    if !params[:tf_website].blank?  
      @Website = "Website"
      @Website_detail = params[:tf_website]
      @Website_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private? => "0", :Preferred => @Website_Preferred)
      @communication.save
    end

    if !params[:tf_twitter].blank?  
      @Twitter = "Phone"
      @Twitter_detail = params[:tf_twitter]
      @Twitter_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private? => "0", :Preferred => @Twitter_Preferred)
      @communication.save
    end
  end
    
    render 'new'
    #@user = User.new(user_params)
  end

  def destroy
  end

  def reset_password
    
    user = User.find_by(email: current_user.email.downcase)
    #puts user.authenticate(params[:tf_currentpassword])
    #user = User.find(current_user.id)
    if user && user.authenticate(params[:tf_currentpassword])
      puts "Saghir"
       user.update_attribute( :password, params[:tf_newpassword] )
       user.update_attribute( :password_confirmation, params[:tf_re_enterpassword] )
    end
    redirect_to '/default'
  end



  def delete_my_account
    user = User.find_by(email: current_user.email.downcase)
    if user && user.authenticate(params[:tf_password])
      puts "Hassan"
      User.delete( user.id )
      Availability.delete_all(:UserID => user.id)
      Profession.delete_all(:UserID => user.id)
      Education.delete_all(:UserID => user.id)
      Communication.delete_all(:UserID => user.id)
    end
    redirect_to root_path
  end

  def show

  end

  def new
  	@user_basic=User.find(current_user.id)
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user_profession=Profession.where(:UserID => current_user.id)
  	@user_education=Education.where(:UserID => current_user.id)
    @user_communication=Communication.where(:UserID => current_user.id)


  end

  def index
    @user_basic=User.find(current_user.id)
  end

 def update

 end
end
