class Chatroom < ApplicationRecord

	belongs_to :f_user
	belongs_to :c_user
	has_many :messages, dependent: :destroy

end
