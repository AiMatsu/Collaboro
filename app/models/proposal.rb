class Proposal < ApplicationRecord

	belongs_to :f_user
	has_many :favorite_hearts, dependent: :destroy

	attachment :p_image

end
