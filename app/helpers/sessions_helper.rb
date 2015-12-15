module SessionsHelper

  def sign_in(member)
  	session[:member_id] = member.id 
  	puts session[:member_id]
    #remember_token = Member.new_remember_token
    #cookies.permanent[:remember_token] = remember_token
    #member.update_attribute(:remember_token, Member.digest(remember_token))
    #self.current_member = member
  end
  def remember(member)
    member.remember
    cookies.permanent.signed[:member_id] = member.id
    cookies.permanent[:remember_token] = member.remember_token
  end
  def current_member
  	@current_member ||= Member.find_by(id: session[:member_id])
  end
  def signed_in?
  	!current_member.nil?
  end
  def forget(member)
  
    cookies.delete(:member_id)
    cookies.delete(:remember_token)
  end
  def sign_out
    forget(current_member)
  	session.delete(:member_id)
  	@current_member= nil
  end
end
