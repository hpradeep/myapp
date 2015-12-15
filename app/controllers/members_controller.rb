class MembersController < ApplicationController
  def new
  	@member = Member.new
  end
  def show
  	@member = Member.find(params[:id])
  end
  def create
  	@member = Member.new(member_params)
  	if @member.save
  		sign_in @member
  		flash[:success] = "Welcome to Sample App!"
  		redirect_to @member
  		#handle it
  	else
  		render 'new'
  	end
  end
  private
  def member_params
  	params.require(:member).permit(:name,:email,:password,:password_confirmation)
  	end
end
