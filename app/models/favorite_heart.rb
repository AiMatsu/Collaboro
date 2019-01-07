class FavoriteHeart < ApplicationRecord

	belongs_to :c_user
	belongs_to :proposal

end

