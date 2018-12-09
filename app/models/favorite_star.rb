class FavoriteStar < ApplicationRecord

	belongs_to :f_user
	belongs_to :request

end
