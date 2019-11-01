class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :comments
  	has_many :likes
	has_many :tags, through: :gossips
	has_many :private_messages
	has_many :join_pm_recipients
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
	validates :first_name, presence: true
	validates :last_name, presence: true

  def already_liked(gossipid)
    self.likes.map{|like| like.gossip_id}.include?(gossipid)
  end

   def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
