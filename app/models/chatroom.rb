class Chatroom < ApplicationRecord

	has_many :messages, dependent: :destroy
	belongs_to :f_user
	belongs_to :c_user

end
