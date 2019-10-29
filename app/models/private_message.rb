class PrivateMessage < ApplicationRecord
	belongs_to :user
	has_many :join_pm_recipients
	validates :content, presence: true
	validates :user_id, presence: true
end
