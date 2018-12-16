class Proposal < ApplicationRecord

	belongs_to :f_user
	has_many :favorite_hearts, dependent: :destroy
	has_many :c_users, through: :favorite_hearts

	attachment :p_image

	def favorited_by?(c_user)
        favorite_hearts.where(c_user_id: c_user.id).exists?
    end

    def self.search(search) #ここでのself.はProposal.を意味する
	    if search
	      where(['body LIKE ? OR location LIKE ?', "%#{search}%", "%#{search}%"]) #検索との部分一致を表示。#Proposal.は省略
	    else
	      all #全て表示。#Proposal.は省略
	    end
	  end


end


