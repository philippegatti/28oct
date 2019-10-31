class Like < ApplicationRecord
	belongs_to :user
	belongs_to :gossip
	validate :single_like

	def single_like
		if User.find(user_id).already_liked(gossip_id)
			errors.add(:gossip_id, "can't like twice")
		end
	end
end
