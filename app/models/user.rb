class User < ActiveRecord::Base
  has_many :educations, dependent: :destroy
  has_many :professions #, dependent: :destroy
  has_many :Communications, dependent: :destroy
  has_many :availabilities,dependent: :destroy
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :First_Name, presence: true,length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #				uniqueness:  { case_sensitive: false }
  	
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, :presence => {:message => "Enter your email address!" }, :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"}, :uniqueness => {:case_sensitive => false, :message => "Email already exists!"}

  #validates :email, presence: true, :format=> { :with=> VALID_EMAIL_REGEX , :message=> 'Enter your Email Address' }
  #validates :email, uniqueness:  { case_sensitive: false }, message: 'Please provide a valid Email'
  
    validates :password, length: { minimum: 6 }
    #validates :password, :presence => true, :confirmation => true,
    #:length => { minimum: 6 }, :on => :create
  	has_secure_password

  	def User.new_remember_token
  		SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
  		Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

  	def create_remember_token
  		self.remember_token = User.encrypt(User.new_remember_token)
  	end
end
