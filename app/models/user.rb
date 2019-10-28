class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :tags, through: :gossips
	has_many :private_messages
  	has_many :join_pm_recipients
end
