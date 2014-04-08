class StaticPagesController < ApplicationController
  def home
  end

  def default
  end

  def update
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?',params[:id], current_user.id, "0")
    #requestfrom = User.where(@user.RequestFrom)
    #requestfrom.first.update_attribute( :RequestFrom, requestfrom)
     # requestfrom.first.update_attribute(:RequestTo => current_user.id)
    requestfrom.first.update_attribute(:IsApproved, "2")
    #Userrequest.requestfrom.save
    
    redirect_to '/default'
    #input_message.update_attributes(:status => params[:status]) 
  end

  def creates
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?', params[:id], current_user.id, "0")
    #requestfrom = @user.RequestFrom
    #Userrequest.update_attributes( :RequestFrom => requestfrom, :RequestTo => current_user.id, :IsApproved => "1")
    @user_request = Userrequest.new( :RequestFrom => current_user.id , :RequestTo => params[:id] , :IsApproved => "1")
    requestfrom.first.update_attribute(:IsApproved, "1")
    @user_request.save
    redirect_to '/default'
  end

  def pending_request
    @user = Userrequest.select('"RequestFrom"').where('"RequestTo" = ? AND "IsApproved" = ?', current_user.id, "0")
  end

  def request_I_have_sent
    @user = Userrequest.select('"RequestTo"').where('"RequestFrom" = ? AND "IsApproved" = ?', current_user.id ,"0")
  end
  def connections
  	@user = Userrequest.select('"RequestFrom"').where('"RequestTo" = ? AND "IsApproved" = ?', current_user.id, "1")
  end
end
