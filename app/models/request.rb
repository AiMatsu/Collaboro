class Request < ApplicationRecord

	belongs_to :c_user
	has_many :favorite_stars, dependent: :destroy

end
