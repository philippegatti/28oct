class Gossip < ApplicationRecord
	belongs_to :user
	has_many :join_gossip_tags
	has_many :tags, through: :join_gossip_tags
	has_many :comments
	validates :title, presence: true
	validates :content, presence: true
	validates :user_id, presence: true
end
