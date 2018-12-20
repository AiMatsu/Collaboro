class Blog < ApplicationRecord

	belongs_to :f_user

	attachment :b_image

	enum b_category: { "収穫情報": 0, "レシピ紹介": 1, "コラボ情報": 2, "その他": 3 }

	validates :b_title, presence: true
	validates :b_body , presence: true

end

