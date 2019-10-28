class PrivateMessage < ApplicationRecord
	belongs_to :user
	has_many :join_pm_recipients
end
