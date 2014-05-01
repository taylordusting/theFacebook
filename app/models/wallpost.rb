class Wallpost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC')}
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true


	def self.from_users_friended_by(user)
    friend_user_ids = "SELECT friend_id FROM friendships
                         WHERE friend_id = :user_id"
    where("user_id IN (#{friend_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
