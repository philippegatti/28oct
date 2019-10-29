class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gossip
	validates :content, presence: true
	validates :user_id, presence: true
	validates :gossip_id, presence: true
end
