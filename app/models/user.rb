class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :wallposts, dependent: :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'"
  
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: { minimum: 6 }
  
  


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    Micropost.from_users_friended_by(self)
  end

  #def following?(other_user)
   #relationships.find_by(followed_id: other_user.id)
  #end

  def friended(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  #def unfollow!(other_user)
   # relationships.find_by(followed_id: other_user.id).destroy
  #end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
