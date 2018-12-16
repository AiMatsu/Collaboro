class Blog < ApplicationRecord

	belongs_to :f_user

	attachment :b_image

	# enum b_category: { harvest: 0, recipe: 1, collabo: 2, other: 3 }
	enum b_category: { "収穫情報": 0, "レシピ紹介": 1, "コラボ情報": 2, "その他": 3 }

end
