class SessionsController < ApplicationController
	def new
	end
	def create
		member = Member.find_by(email: params[:session][:email].downcase)
		if member && member.authenticate(params[:session][:password])
			 sign_in member
        params[:session][:remember_me] == '1' ? remember(member) : forget(member)
			remember member
			redirect_to member
		else
			flash.now[:error] = 'invalid email/password combination'
			render 'new'
		end	
	end
	def destroy
		sign_out if signed_in?
		redirect_to root_url, notice: 'Signed out successfully'
	end
end
