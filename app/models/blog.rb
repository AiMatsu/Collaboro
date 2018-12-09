class Blog < ApplicationRecord

	belongs_to :f_user

	attachment :b_image

end
