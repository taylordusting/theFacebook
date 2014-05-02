class Post < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :posted, class_name: "User"
  default_scope -> { order('created_at DESC')}
  validates :poster_id, presence: true
  validates :posted_id, presence: true

  def self.from_users_friended_by(user)

  	friend_user_ids = "SELECT friend_id FROM friendships"
    where("posted_id AND poster_id IN (#{friend_user_ids}) OR posted_id = :user_id",
          user_id: user.id)
  end
	#followed_user_ids = user.friends
    #where("posted_id IN (:followed_user_ids) OR posted_id = :user_id",
     #     followed_user_ids: followed_user_ids, user_id: user)
  #end
end
