class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
has_many :friendships
has_many :friends, :through => :friendships
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  #has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  #has_many :followed_users, through: :relationships, source: :followed
  #has_many :reverse_relationships, foreign_key: "followed_id",
                                   #class_name:  "Relationship",
                                   #dependent:   :destroy
  #has_many :followers, through: :reverse_relationships, source: :follower
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
    Micropost.from_users_followed_by(self)
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
