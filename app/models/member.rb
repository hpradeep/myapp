class Member< ActiveRecord::Base
	#before_create :create_remember_token
	 attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 50}
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	 validates  :email, presence: true, format: VALID_EMAIL_REGEX
	  validates  :email,uniqueness: {case_sensitive: false}
	  has_secure_password            
	  validates :presence, length: {minimum: 6} 
	   def Member.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	 def Member.new_token
    SecureRandom.urlsafe_base64
end
 def remember
    self.remember_token = Member.new_token
    update_attribute(:remember_digest, Member.digest(remember_token))
  end
   def authenticated?(remember_token)
     return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
   def forget
    update_attribute(:remember_digest, nil)
  end
  
  


  end

  #def Member.digest(token)
   # Digest::SHA1.hexdigest(token.to_s)
  #end

 # private

  #  def create_remember_token
   #   self.remember_token = Member.digest(Member.new_remember_token)
    #end
	 # private
	  #def create_remember_token
	  #end           
#end
